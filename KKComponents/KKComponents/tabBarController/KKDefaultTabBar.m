//
//  KKDefaultTabBar
    

#import "KKDefaultTabBar.h"

@implementation KKDefaultTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
    {
        
    }
    return self;
}

- (void)setDefaultTabBarMidButtonWithImage:(NSString *)imageName
                             ActionHandler:(void(^)(void))actionHandler{
    if ( _midButton != nil && _midButton.superview != nil)
    {
        return;
    }
    UIImage *image = nil;
    if (imageName.length) {
        image = [UIImage imageNamed:imageName];
    }
    
    if (image == nil) {
        _midButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    }else{
        _midButton = [UIButton new];
        [_midButton setBackgroundImage:image forState:UIControlStateNormal];
    }
    self.midButtonClickAction =  actionHandler;
    [_midButton addTarget:self action:@selector(clickTabBarMidButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_midButton];
}

- (void)clickTabBarMidButton{
    if (self.midButtonClickAction) {
        self.midButtonClickAction();
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
     NSLog(@"%f",self.bounds.size.height - self.safeAreaInsets.bottom);
    CGFloat tabBarHeight = self.bounds.size.height - self.safeAreaInsets.bottom;
    CGFloat sizeW = tabBarHeight - 4.0;
    _midButton.frame = CGRectMake((self.bounds.size.width - sizeW)*0.5, 2, sizeW, sizeW);
    
}

@end
