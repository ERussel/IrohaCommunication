#import "IRPeerSignature+Proto.h"
#import "Primitive.pbobjc.h"
#import "IrohaCrypto/NSData+Hex.h"

@implementation IRPeerSignatureFactory (Proto)

+ (nullable id<IRPeerSignature>)peerSignatureFromPbSignature:(nonnull Signature *)pbSignature
                                                       error:(NSError*_Nullable*_Nullable)error {
    id<IRSignatureProtocol> signature = [[IREd25519Sha512Signature alloc] initWithRawData:pbSignature.signature];

    if (!signature) {
        if (error) {
            NSString *message = [NSString stringWithFormat:@"Invalid signature %@", [pbSignature.signature toHexString]];
            *error = [NSError errorWithDomain:NSStringFromClass([IRPeerSignatureFactory class])
                                         code:IRPeerSignatureFactoryProtoErrorInvalidArgument
                                     userInfo:@{NSLocalizedDescriptionKey: message}];
        }
        return nil;
    }

    id<IRPublicKeyProtocol> publicKey = [[IREd25519PublicKey alloc] initWithRawData:pbSignature.publicKey];

    if (!publicKey) {
        if (error) {
            NSString *message = [NSString stringWithFormat:@"Invalid public key %@", [pbSignature.publicKey toHexString]];
            *error = [NSError errorWithDomain:NSStringFromClass([IRPeerSignatureFactory class])
                                         code:IRPeerSignatureFactoryProtoErrorInvalidArgument
                                     userInfo:@{NSLocalizedDescriptionKey: message}];
        }
        return nil;
    }

    return [IRPeerSignatureFactory peerSignature:signature
                                       publicKey:publicKey
                                           error:error];
}

@end
