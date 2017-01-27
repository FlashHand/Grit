//
//  RTNavigationController.m
//  Grit
//
//  Created by BoWang on 2017/1/9.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "RTNavigationController.h"
#import "RTTabBarViewController.h"
@interface RTNavigationController ()

@end
@implementation RTNavigationController
+(RTNavigationController *)sharedSingleton{
    static RTNavigationController *sharedSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton=[[RTNavigationController alloc]initWithRootViewController:[RTTabBarViewController sharedSingleton]];
    });
    return sharedSingleton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[RTTabBarViewController sharedSingleton]loadVCs];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
