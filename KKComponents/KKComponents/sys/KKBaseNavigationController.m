//
//  KKBaseNavigationController
    

#import "KKBaseNavigationController.h"

@interface KKBaseNavigationController ()

@end

@implementation KKBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBarAppearance *appearance =  [UINavigationBarAppearance new];
    appearance.backgroundColor = [UIColor colorWithRed:168/255.0 green:165/255.0 blue:1 alpha:1];
    appearance.titleTextAttributes = @{
        NSForegroundColorAttributeName:[UIColor blackColor],
        NSFontAttributeName:[UIFont systemFontOfSize:24.0 weight:UIFontWeightBlack]
    };
    self.navigationBar.standardAppearance = appearance;
    self.navigationBar.scrollEdgeAppearance = appearance;
    
    
}



@end
