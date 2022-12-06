#ifndef TrueLayerObjCColors_h
#define TrueLayerObjCColors_h

#import "TrueLayerVisualSettingsProvider.h"

/// An implementation of `TrueLayerObjCColorProvider`. These properties default to `nil` and can be customized individually.
/// The properties that remain `nil` will be replaced by the default visual settings in the TrueLayerSDK.
@interface TrueLayerObjCColors: NSObject<TrueLayerObjCColorProvider>
@end

#endif /* TrueLayerObjCColors_h */
