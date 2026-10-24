//
//  KKDefaultTabBar
    

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKDefaultTabBar : UITabBar
@property (nonatomic,strong) UIButton *midButton;
@property (nonatomic,strong) void(^midButtonClickAction)(void);

- (void)setDefaultTabBarMidButtonWithImage:(NSString *)imageName
                             ActionHandler:(void(^)(void))actionHandler;
@end

NS_ASSUME_NONNULL_END
