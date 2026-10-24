//
//  ViewController
    

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *kkComponentsTableView;
@property (nonatomic,strong)NSArray *kkComponentsSectionArray;

@end

@implementation ViewController

- (NSArray *)kkComponentsSectionArray{
    if (!_kkComponentsSectionArray) {
        _kkComponentsSectionArray = @[
            @{@"sectionTitle":@"tabBarControllers",
              @"openStyle":@"1",
              @"classNames":@[
                @"KKDefaultTabBarContoller",
            ]}
        ];
    }
    return _kkComponentsSectionArray;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _kkComponentsTableView.frame = self.view.bounds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Components";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _kkComponentsTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_kkComponentsTableView];
    _kkComponentsTableView.dataSource = self;
    _kkComponentsTableView.sectionHeaderHeight = 38.0;
    _kkComponentsTableView.rowHeight = 56.0;
    _kkComponentsTableView.delegate = self;
    _kkComponentsTableView.backgroundColor = [UIColor clearColor];
    [_kkComponentsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ComptsTitlesCellIdentifier"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.kkComponentsSectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary *sku = self.kkComponentsSectionArray[section];
    if (sku == nil) {
        return 0;
    }
    
    NSArray *classNames = sku[@"classNames"];
    
    if (classNames == nil || classNames.count == 0) {
        return  0;
    }
    
    return classNames.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *sku = self.kkComponentsSectionArray[section];
    if (sku == nil) {
        return nil;
    }
    NSString *sectionTitle = sku[@"sectionTitle"];
    
    return sectionTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComptsTitlesCellIdentifier" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightMedium];
    cell.textLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
    if (indexPath.section <  self.kkComponentsSectionArray.count) {
        NSDictionary *sku = self.kkComponentsSectionArray[indexPath.section];
        NSArray *classNames = sku[@"classNames"];
        if (classNames == nil || classNames.count == 0) {
            cell.hidden = YES;
        }else{
            cell.hidden = NO;
            cell.textLabel.text = classNames[indexPath.row];
        }
    }else{
        cell.hidden = YES;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section <  self.kkComponentsSectionArray.count)
    {
        NSDictionary *sku = self.kkComponentsSectionArray[indexPath.section];
        NSArray *classNames = sku[@"classNames"];
        if (classNames == nil || classNames.count == 0)
        {
            return;
        }else{
            
            NSString *className = classNames[indexPath.row];
            
            id controller = [NSClassFromString(className) new];
            if (controller != nil && [controller isKindOfClass:[UIViewController class]])
            {
                UIViewController *viewController = (UIViewController *)controller;
                viewController.modalPresentationStyle = UIModalPresentationFullScreen;
                [self presentViewController:viewController animated:YES completion:nil];
            }
 
        }
    }
}

@end
