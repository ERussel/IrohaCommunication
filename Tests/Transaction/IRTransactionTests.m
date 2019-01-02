@import XCTest;
@import IrohaCommunication;
@import IrohaCrypto;

static NSString * const VALID_ACCOUNT_NAME = @"bob";
static NSString * const VALID_DOMAIN = @"gmail.com";
static NSString * const VALID_ASSET_NAME = @"testcoin";
static NSString * const VALID_IPV4 = @"192.168.0.1";
static NSString * const VALID_PORT = @"8080";
static NSString * const VALID_ROLE = @"admin";

@interface IRTransactionTests : XCTestCase

@end

@implementation IRTransactionTests

- (void)testTransactionBuildWithAllCommandsAndSingleSignature {
    id<IRDomain> domain = [IRDomainFactory domainWithIdentitifer:VALID_DOMAIN error:nil];

    id<IRAccountId> accountId = [IRAccountIdFactory accountIdWithName:VALID_ACCOUNT_NAME
                                                               domain:domain
                                                                error:nil];

    id<IRAssetId> assetId = [IRAssetIdFactory assetIdWithName:VALID_ASSET_NAME
                                                       domain:domain
                                                        error:nil];

    id<IRAddress> address = [IRAddressFactory addressWithIp:VALID_IPV4
                                                       port:VALID_PORT
                                                      error:nil];

    id<IRAmount> amount = [IRAmountFactory amountFromUnsignedInteger:100 error:nil];

    id<IRRoleName> roleName = [IRRoleNameFactory roleWithName:VALID_ROLE error:nil];

    id<IRCryptoKeypairProtocol> keypair = [[[IREd25519KeyFactory alloc] init] createRandomKeypair];

    IRTransactionBuilder* builder = [IRTransactionBuilder builderWithCreatorAccountId:accountId];
    builder = [builder addAssetQuantity:assetId amount:amount];
    builder = [builder addPeer:address publicKey:[keypair publicKey]];
    builder = [builder addSignatory:accountId publicKey:[keypair publicKey]];
    builder = [builder appendRole:accountId roleName:roleName];
    builder = [builder createAccount:accountId publicKey:[keypair publicKey]];
    builder = [builder createAsset:assetId precision:18];
    builder = [builder createDomain:domain defaultRole:nil];
    builder = [builder createDomain:domain defaultRole:roleName];
    builder = [builder createRole:roleName permissions:@[]];
    builder = [builder detachRole:accountId roleName:roleName];
    builder = [builder grantPermission:accountId permission:[IRGrantablePermissionFactory canSetMyAccountDetail]];
    builder = [builder removeSignatory:accountId publicKey:[keypair publicKey]];
    builder = [builder revokePermission:accountId permission:[IRGrantablePermissionFactory canAddMySignatory]];
    builder = [builder setAccountDetail:accountId key:@"key" value:@"value"];
    builder = [builder setAccountQuorum:accountId quorum:1];
    builder = [builder subtractAssetQuantity:assetId amount:amount];
    builder = [builder transferAsset:accountId
                  destinationAccount:accountId
                             assetId:assetId
                         description:@"Test transfer"
                              amount:amount];

    NSError *error = nil;

    id<IRTransaction> transaction = [builder build:&error];

    XCTAssertNotNil(transaction);
    XCTAssertEqualObjects([transaction.creator identifier], [accountId identifier]);
    XCTAssertNil(error);

    error = nil;

    id<IRSignatureCreatorProtocol> signatory = [[IREd25519Sha512Signer alloc] initWithPrivateKey:[keypair privateKey]];
    id<IRTransaction> signedTransaction = [transaction signedWithSignatories:@[signatory]
                                                         signatoryPublicKeys:@[[keypair publicKey]]
                                                                       error:&error];

    XCTAssertNotNil(signedTransaction);
    XCTAssertNil(error);

    error = nil;

    id<IRPeerSignature> peerSignature = [transaction signWithSignatory:signatory
                                                    signatoryPublicKey:[keypair publicKey]
                                                                 error:&error];

    XCTAssertNotNil(peerSignature);
    XCTAssertNil(error);

    id<IRPeerSignature> resultSignature = [signedTransaction.signatures firstObject];
    XCTAssertEqualObjects(peerSignature.signature.rawData, resultSignature.signature.rawData);
    XCTAssertEqualObjects(peerSignature.publicKey.rawData, resultSignature.publicKey.rawData);

    IREd25519Sha512Verifier *verifier = [[IREd25519Sha512Verifier alloc] init];
    BOOL verified = [verifier verify:resultSignature.signature
                     forOriginalData:[transaction transactionHashWithError:nil]
                      usingPublicKey:resultSignature.publicKey];

    XCTAssertTrue(verified);
}

@end
