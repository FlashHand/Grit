//
//  NonlinearViewController.m
//  Grit
//
//  Created by BoWang on 2017/1/27.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "NonlinearViewController.h"

@interface NonlinearViewController ()

@end

@implementation NonlinearViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Buttons
-(UIButton *)addButton{
    UIButton *addButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [addButton setCenter:CGPointMake(self.view.width/2, self.view.height-80)];
    [addButton setBackgroundColor:kColor_Theme_Green];
    [addButton.layer ext_setCornerRadius:25];
    [self.view addSubview:addButton];
    return addButton;
}
#pragma mark - Actions
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
