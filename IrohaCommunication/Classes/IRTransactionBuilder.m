#import "IRTransactionBuilder.h"
#import "Transaction.pbobjc.h"
#import "Commands.pbobjc.h"
#import "Primitive.pbobjc.h"

static const NSUInteger DEFAULT_QUORUM = 1;

@interface IRTransactionBuilder()

@property(strong, nonatomic)NSString *accountId;
@property(strong, readwrite)NSDate *date;
@property(nonatomic, readwrite)NSUInteger quorum;
@property(strong, nonatomic)NSMutableArray *commands;

@end

@implementation IRTransactionBuilder

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];

    if (self) {
        _quorum = DEFAULT_QUORUM;
        _commands = [NSMutableArray array];
    }

    return self;
}

#pragma mark - Commands

- (nonnull instancetype)addAssetQuantity:(nonnull id<IRAssetId>)assetId
                                  amount:(nonnull id<IRAmount>)amount {

    AddAssetQuantity *command = [[AddAssetQuantity alloc] init];
    command.assetId = [assetId identifier];
    command.amount = [amount value];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)subtractAssetQuantity:(nonnull id<IRAssetId>)assetId
                                       amount:(nonnull id<IRAmount>)amount {

    SubtractAssetQuantity *command = [[SubtractAssetQuantity alloc] init];
    command.assetId = [assetId identifier];
    command.amount = [amount value];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)addPeer:(nonnull id<IRAddress>)address
                      publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey {

    AddPeer *command = [[AddPeer alloc] init];
    command.peer = [[Peer alloc] init];
    command.peer.address = [address value];
    command.peer.peerKey = [publicKey rawData];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)addSignatory:(nonnull id<IRAccountId>)accountId
                           publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey {

    AddSignatory *command = [[AddSignatory alloc] init];
    command.accountId = [accountId identifier];
    command.publicKey = [publicKey rawData];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)removeSignatory:(nonnull id<IRAccountId>)accountId
                              publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey {

    RemoveSignatory *command = [[RemoveSignatory alloc] init];
    command.accountId = [accountId identifier];
    command.publicKey = [publicKey rawData];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)appendRole:(nonnull id<IRAccountId>)accountId
                          roleName:(nonnull id<IRRoleName>)roleName {

    AppendRole *command = [[AppendRole alloc] init];
    command.accountId = [accountId identifier];
    command.roleName = [roleName value];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)createAccount:(nonnull id<IRAccountId>)accountId
                            publicKey:(nonnull id<IRPublicKeyProtocol>)publicKey {

    CreateAccount *command = [[CreateAccount alloc] init];
    command.accountName = [accountId name];
    command.domainId = [accountId.domain identifier];
    command.publicKey = [publicKey rawData];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)createAsset:(nonnull id<IRAssetId>)assetId
                          precision:(UInt32)precision {

    CreateAsset *command = [[CreateAsset alloc] init];
    command.assetName = [assetId name];
    command.domainId = [assetId.domain identifier];
    command.precision = precision;

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)createDomain:(nonnull id<IRDomain>)domainId
                         defaultRole:(nonnull id<IRRoleName>)defaultRole {

    CreateDomain *command = [[CreateDomain alloc] init];
    command.domainId = [domainId identifier];
    command.defaultRole = [defaultRole value];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)createRole:(nonnull id<IRRoleName>)roleName
                       permissions:(nonnull NSSet<id<IRRolePermission>>*)permissions {

    CreateRole *command = [[CreateRole alloc] init];
    command.roleName = roleName.value;

    GPBEnumArray *rawPermissions = [GPBEnumArray array];

    for (id<IRRolePermission> permission in permissions) {
        [rawPermissions addValue:permission.value];
    }

    command.permissionsArray = rawPermissions;

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)detachRole:(nonnull id<IRAccountId>)accountId
                          roleName:(nonnull id<IRRoleName>)roleName {

    DetachRole *command = [[DetachRole alloc] init];
    command.accountId = [accountId identifier];
    command.roleName = [roleName value];

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)grantPermission:(nonnull id<IRAccountId>)accountId
                             permission:(nonnull id<IRGrantablePermission>)grantablePermission {

    GrantPermission *command = [[GrantPermission alloc] init];
    command.accountId = [accountId identifier];
    command.permission = grantablePermission.value;

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)revokePermission:(nonnull id<IRAccountId>)accountId
                              permission:(nonnull id<IRGrantablePermission>)grantablePermission {

    RevokePermission *command = [[RevokePermission alloc] init];
    command.accountId = [accountId identifier];
    command.permission = grantablePermission.value;

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)setAccountDetail:(nonnull id<IRAccountId>)accountId
                                     key:(nonnull NSString*)key
                                   value:(nonnull NSString*)value {

    SetAccountDetail *command = [[SetAccountDetail alloc] init];
    command.accountId = [accountId identifier];
    command.key = key;
    command.value = value;

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)setAccountQuorum:(nonnull id<IRAccountId>)accountId
                                  quorum:(UInt32)quorum {

    SetAccountQuorum *command = [[SetAccountQuorum alloc] init];
    command.accountId = [accountId identifier];
    command.quorum = quorum;

    [_commands addObject:command];

    return self;
}

- (nonnull instancetype)transferAsset:(nonnull id<IRAccountId>)sourceAccountId
                   destinationAccount:(nonnull id<IRAccountId>)destinationAccountId
                              assetId:(nonnull id<IRAssetId>)assetId
                          description:(nonnull NSString*)transferDescription
                               amount:(nonnull id<IRAmount>)amount {

    TransferAsset *command = [[TransferAsset alloc] init];
    command.srcAccountId = [sourceAccountId identifier];
    command.destAccountId = [destinationAccountId identifier];
    command.assetId = [assetId identifier];
    command.description_p = transferDescription;
    command.amount = amount.value;

    [_commands addObject:command];

    return self;
}

#pragma mark - Protocol

- (nonnull instancetype)withCreatorAccountId:(nonnull id<IRAccountId>)creatorAccountId {
    _accountId = [[creatorAccountId identifier] copy];
    
    return self;
}

- (nonnull instancetype)withCreatedDate:(nonnull NSDate*)date {
    _date = [date copy];

    return self;
}

- (nonnull instancetype)withQuorum:(NSUInteger)quorum {
    _quorum = quorum;

    return self;
}

- (nonnull instancetype)addCommand:(nonnull Command*)command {
    [_commands addObject: command];

    return self;
}

- (nullable IRTransaction *)build:(NSError **)error {
    return [[IRTransaction alloc] init];
}

@end
