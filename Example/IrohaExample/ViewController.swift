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

    private var networkService: IRNetworkService?

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let irohaAddress = try IRAddressFactory.address(withIp: Constants.irohaIp, port: Constants.irohaPort)

            networkService = IRNetworkService(address: irohaAddress)

            createAccount(irohaService: networkService!)

        } catch {
            print("Error: \(error)")
        }
    }

    // MARK: Private

    private func createAccount(irohaService: IRNetworkService) {
        do {
            let domain = try IRDomainFactory.domain(withIdentitifer: Constants.domainId)
            let adminAccountId = try IRAccountIdFactory.accountId(withName: Constants.adminAccountName, domain: domain)
            let newAccountId = try IRAccountIdFactory.accountId(withName: Constants.newAccountName, domain: domain)

            let newAccountPublicKeyData = NSData(hexString: Constants.newAccountPublicKey)! as Data
            guard let newAccountPublicKey = IREd25519PublicKey(rawData: newAccountPublicKeyData) else {
                print("New account public key invalid")
                return
            }

            let adminPublicKeyData = NSData(hexString: Constants.adminPublicKey)! as Data
            guard let adminPublicKey = IREd25519PublicKey(rawData: adminPublicKeyData) else {
                print("Admin public key invalid")
                return
            }

            let adminPrivateKeyData = NSData(hexString: Constants.adminPrivateKey)! as Data
            guard let adminPrivateKey = IREd25519PrivateKey(rawData: adminPrivateKeyData) else {
                print("Admin private key invalid")
                return
            }

            guard let adminSigner = IREd25519Sha512Signer(privateKey: adminPrivateKey) else {
                print("Admin signer creation failed")
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

            _ = irohaService.performQuery(queryRequest).onThen({ (response) -> IRPromise? in
                if let errorResponse = response as? IRErrorResponse {
                    if errorResponse.reason == .noAccount {
                        print("No account \(newAccountId.identifier()) found. Creating new one...")

                        return irohaService.send(transaction)
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
                return irohaService.onTransactionStatus(.committed, withHash: transactionHash)
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
}

