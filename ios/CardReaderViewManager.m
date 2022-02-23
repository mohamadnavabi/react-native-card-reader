#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(CardReaderViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXPORT_VIEW_PROPERTY(number, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(onNumberDetected, RCTDirectEventBlock)

@end
