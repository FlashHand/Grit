//
//  LinearViewController.m
//  Grit
//
//  Created by BoWang on 2017/1/27.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "LinearViewController.h"
#import "EditViewController.h"
#import "HabitListCell.h"
@interface LinearViewController ()
{
    UITableView *_tableViewLinear;
    UIButton *_addButton;
}
@end

@implementation LinearViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self tableView];
    [self addButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UI
-(UIButton *)addButton{
    if (!_addButton) {
        UIButton *addButton=[[UIButton alloc]init];
        
        [addButton setBackgroundColor:kColor_Theme_Green];
        [addButton.layer ext_setCornerRadius:25];
        [self.view addSubview:_addButton = addButton];
        [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(50));
            make.height.equalTo(@(50));
            make.bottom.equalTo(self.view.mas_bottom).with.offset(-60);
            make.centerX.equalTo(self.view.mas_centerX).with.offset(0);
        }];
        @weakify(self);
        [[_addButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            @strongify(self);
            [self goEdit];
        }];
    }
    return _addButton;
}
-(UITableView *)tableView{
    if (!_tableViewLinear) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-64-44) style:UITableViewStylePlain];
        [self.view addSubview:_tableViewLinear=tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).with.offset(0);
            make.left.equalTo(self.view.mas_left).with.offset(0);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(-44);
            make.right.equalTo(self.view.mas_right).with.offset(0);
        }];
    }
    return _tableViewLinear;
}
#pragma mark - Actions
-(void)goEdit{
    EditViewController *evc=[[EditViewController alloc]initWithType:HabitTypeLinear callBack:^(HabitModel *model) {
        
    }];
    [self.navigationController pushViewController:evc animated:YES];
}
-(void)updateTable{
    
}
#pragma mark - Data
-(void)requestList{
    
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
