//
//  RTTabBarViewController.m
//  Grit
//
//  Created by BoWang on 2017/1/9.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "RTTabBarViewController.h"
#import "HomeViewController.h"
#import "SettingsViewController.h"
#import "NonlinearViewController.h"
#import "LinearViewController.h"
@interface RTTabBarViewController ()

@end
static RTTabBarViewController *sharedSingleton;
@implementation RTTabBarViewController
+(RTTabBarViewController *)sharedSingleton{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton=[RTTabBarViewController new];
    });
    return sharedSingleton;
}
-(instancetype)init{
    if (sharedSingleton) {
        self=sharedSingleton;
    }
    else{
        self=[super init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor colorWithHex:0x333333 alpha:1]];
    [titleLabel setText:@"Habist"];
    [titleLabel setFont:fast_font_regular(20)];
    [self.navigationItem setTitleView:titleLabel];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Public methods
-(void)loadVCs{
    NonlinearViewController *nvc=[NonlinearViewController new];
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:fast_local(@"item1") image:nil selectedImage:nil];
    nvc.tabBarItem=item1;
    
    LinearViewController *lvc=[LinearViewController new];
    UITabBarItem *item2=[[UITabBarItem alloc]initWithTitle:fast_local(@"item2") image:nil selectedImage:nil];
    lvc.tabBarItem=item2;

    [self setViewControllers:@[nvc,lvc] animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
