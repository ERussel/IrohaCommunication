#ifndef IRSerializable_h
#define IRSerializable_h

@protocol IRProtobufTransformable <NSObject>

- (nullable id)transform:(NSError**)error;

@end

#endif
