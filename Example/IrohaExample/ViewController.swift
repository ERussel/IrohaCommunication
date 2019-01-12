import UIKit
import IrohaCommunication;
import IrohaCrypto;

class ViewController: UIViewController {
    private struct Constants {
        static let newAccountName = "bob"
        static let adminAccountName = "admin"
        static let domainId = "test"
        static let irohaIp = "127.0.0.1"
        static let irohaPort = "50051"
        static let adminPublicKey = "313a07e6384776ed95447710d15e59148473ccfc052a681317a72a69f2a49910"
        static let adminPrivateKey = "f101537e319568c765b2cc89698325604991dca57b9716b58016b253506cab70"
        static let newAccountPublicKey = "69bc8575066fce6f3f2b05fd1e5c0f4c33ecf625733cb89c9ee724473efde4df"
        static let newAccountPrivateKey = "e76ad4f491c0f4b40d85b24addf61c30400a84cc45cc0532efa2d788ad11fcbc"
    }

    let domain: IRDomain = {
        return try! IRDomainFactory.domain(withIdentitifer: Constants.domainId)
    }()

    let adminAccountId: IRAccountId = {
        let domain = try! IRDomainFactory.domain(withIdentitifer: Constants.domainId)
        return try! IRAccountIdFactory.accountId(withName: Constants.adminAccountName, domain: domain)
    }()

    let adminPublicKey: IRPublicKeyProtocol = {
        let adminPublicKeyData = NSData(hexString: Constants.adminPublicKey)! as Data
        return IREd25519PublicKey(rawData: adminPublicKeyData)!
    }()

    let adminSigner: IRSignatureCreatorProtocol = {
        let adminPrivateKeyData = NSData(hexString: Constants.adminPrivateKey)! as Data
        let adminPrivateKey = IREd25519PrivateKey(rawData: adminPrivateKeyData)!
        return IREd25519Sha512Signer(privateKey: adminPrivateKey)!
    }()

    let networkService: IRNetworkService = {
        let irohaAddress = try! IRAddressFactory.address(withIp: Constants.irohaIp, port: Constants.irohaPort)
        return IRNetworkService(address: irohaAddress)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        startCommitStream()
        createAccountIfNeeded()
    }

    // MARK: Private

    private func createAccountIfNeeded() {
        do {
            let newAccountId = try IRAccountIdFactory.accountId(withName: Constants.newAccountName, domain: domain)

            let newAccountPublicKeyData = NSData(hexString: Constants.newAccountPublicKey)! as Data
            guard let newAccountPublicKey = IREd25519PublicKey(rawData: newAccountPublicKeyData) else {
                print("New account public key invalid")
                return
            }

            let queryRequest = try IRQueryBuilder(creatorAccountId: adminAccountId)
                .getAccount(newAccountId)
                .build().signed(withSignatory: adminSigner, signatoryPublicKey: adminPublicKey)

            let transaction = try IRTransactionBuilder(creatorAccountId: adminAccountId)
                .createAccount(newAccountId, publicKey: newAccountPublicKey)
                .build()
                .signed(withSignatories: [adminSigner], signatoryPublicKeys: [adminPublicKey])

            let transactionHash = try transaction.transactionHash()

            print("Requesting account \(newAccountId.identifier())")

            _ = networkService.execute(queryRequest).onThen({ (response) -> IRPromise? in
                if let errorResponse = response as? IRErrorResponse {
                    if errorResponse.reason == .noAccount {
                        print("No account \(newAccountId.identifier()) found. Creating new one...")

                        return self.networkService.execute(transaction)
                    } else {
                        print("Error reason code: \(errorResponse.reason), \(errorResponse.message)")

                        return nil
                    }

                } else if let _ = response as? IRAccountResponse {
                    print("Account \(newAccountId.identifier()) already exists")
                    return nil
                } else {
                    print("Unexpected response \(String(describing: response))")
                    return nil
                }
            }).onThen({ (result) -> IRPromise? in
                print("Transaction has been sent")
                return self.networkService.onTransactionStatus(.committed, withHash: transactionHash)
            }).onThen({ (result) -> IRPromise? in
                print("Transaction has been commited")
                return nil
            }).onError({ (error) -> IRPromise? in
                print("Error received: \(error)")
                return nil
            })

        } catch {
            print("Error: \(error)")
        }
    }

    func startCommitStream() {
        do {
            let commitsRequest = try IRBlockQueryBuilder(creatorAccountId: adminAccountId)
                .build()
                .signed(withSignatory: adminSigner, signatoryPublicKey: adminPublicKey)

            networkService.streamCommits(commitsRequest) { (optionalResponse, done, optionalError) in
                if let response = optionalResponse {
                    guard let block = response.block else {
                        print("Did receive error response: \(String(describing: response.error))")
                        return
                    }

                    print("Did receive commit at height=\(block.height), numOfTransactions=\(block.transactions.count)")
                } else if let error = optionalError {
                    print("Did receive error: \(String(describing: error))")
                }

                if done {
                    print("Did complete streaming")
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }
}

