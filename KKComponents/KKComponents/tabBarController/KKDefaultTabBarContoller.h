//
//  KKDefaultTabBarContoller
    

#import <UIKit/UIKit.h>
#import "KKTabBarViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKDefaultTabBarContoller : UITabBarController
@property (nonatomic,strong) KKTabBarViewModel *tbarViewModel;


- (void)defaultAppearanceConfigurations;
- (void)setDefaultTabBarMidButtonWithImage:(NSString *)imageName
                                     ActionHandler:(void(^)(void))actionHandler;
@end

NS_ASSUME_NONNULL_END
