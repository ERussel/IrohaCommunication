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

            guard let newAccountKeypair = IREd25519KeyFactory().createRandomKeypair() else {
                print("Keypair generation failed")
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

            guard let signer = IREd25519Sha512Signer(privateKey: adminPrivateKey) else {
                print("Signer creation failed")
                return
            }

            let transaction = try IRTransactionBuilder(creatorAccountId: adminAccountId)
                .createAccount(newAccountId, publicKey: newAccountKeypair.publicKey())
                .build()
                .signed(withSignatories: [signer], signatoryPublicKeys: [adminPublicKey])

            let transactionHash = try transaction.transactionHash()

            _ = irohaService.send(transaction).onThen({ (result) -> IRPromise? in
                print("Transaction has been sent")
                return irohaService.onTransactionStatus(.committed, withHash: transactionHash)
            }).onThen({ (result) -> IRPromise? in
                print("Transaction has been commited")
                return nil
            }).onError({ (error) -> IRPromise? in
                print("Transaction error received: \(error)")
                return irohaService.fetchTransactionStatus(transactionHash)
            }).onThen({ (result) -> IRPromise? in
                if let transactionResponse = result as? IRTransactionStatusResponse {
                    print("Current transaction status: \(transactionResponse.status.rawValue)")
                } else {
                    print("Unexpected response object \(String(describing: result))")
                }

                return nil;
            }).onError({ (error) -> IRPromise? in
                print("Receive error on status request: \(error)")

                return nil
            });

        } catch {
            print("Error: \(error)")
        }
    }
}

