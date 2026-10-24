//
//  KKDefaultTabBarContoller
    

#import "KKDefaultTabBarContoller.h"
#import "KKDefaultTabBar.h"


@interface KKDefaultTabBarContoller ()


@end

@implementation KKDefaultTabBarContoller

- (KKTabBarViewModel *)tbarViewModel{
    if (!_tbarViewModel) {
        
    }
    return _tbarViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    KKDefaultTabBar *defaultTabBar = [KKDefaultTabBar new];
    [self setValue:defaultTabBar forKey:@"tabBar"];
    [self defaultAppearanceConfigurations];
    [self setDefaultTabBarMidButtonWithImage:@"" ActionHandler:^{
            
    }];
    
}

//消息转发

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{

    if ([self.tabBar respondsToSelector:aSelector]) {
        return [self.tabBar methodSignatureForSelector:aSelector];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    if ([self.tabBar respondsToSelector:aSelector]) {
        return self.tabBar;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}


- (void)defaultAppearanceConfigurations{
    
    UITabBarAppearance *tabBarAppearance = [UITabBarAppearance new];
    tabBarAppearance.backgroundColor = UIColor.yellowColor;
    tabBarAppearance.shadowColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    self.tabBar.standardAppearance = tabBarAppearance;
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    if (@available(iOS 15.0, *)) {
        self.tabBar.scrollEdgeAppearance = tabBarAppearance;
    } else {
        // Fallback on earlier versions
    }
}



- (void)setDefaultTabBarMidButtonWithImage:(nonnull NSString *)imageName
                             ActionHandler:(nonnull void (^)(void))actionHandler {
    if ([self.tabBar isKindOfClass:[KKDefaultTabBar class]]) {
        KKDefaultTabBar *tabBar = (KKDefaultTabBar *)self.tabBar;
        [tabBar setDefaultTabBarMidButtonWithImage:imageName ActionHandler:actionHandler];
    }
}

@end
