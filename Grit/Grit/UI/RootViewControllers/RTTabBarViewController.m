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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Public methods
-(void)loadVCs{
    NSArray *itemTitles=@[fast_local(@"item1"),fast_local(@"item2")];
    
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
