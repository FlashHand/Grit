//
//  NonlinearViewController.m
//  Grit
//
//  Created by BoWang on 2017/1/27.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "NonlinearViewController.h"
#import "EditViewController.h"
#import "HabitListCell.h"
@interface NonlinearViewController ()
{
    UITableView *_tableViewNonlinear;
    UIButton *_addButton;
}
@end
static NSString *cellId=@"cellId";
@implementation NonlinearViewController
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
    if (!_tableViewNonlinear) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStylePlain];
        
        [self.view addSubview:_tableViewNonlinear=tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).with.offset(0);
            make.left.equalTo(self.view.mas_left).with.offset(0);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(-44);
            make.right.equalTo(self.view.mas_right).with.offset(0);
        }];
        [tableView registerClass:[HabitListCell class] forCellReuseIdentifier:cellId];
        [tableView setDelegate:self];
        [tableView setDataSource:self];
    }
    return _tableViewNonlinear;
}
#pragma mark - Actions
-(void)goEdit{
    EditViewController *evc=[[EditViewController alloc]initWithType:HabitTypeNonlinear callBack:^(HabitModel *model) {
        
    }edit:NO];
    [self.navigationController pushViewController:evc animated:YES];
}
-(void)updateTable{
    
}
#pragma mark - Data
-(void)requestList{
    
}
#pragma mark - TableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HabitListCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    //Mock
    HabitModel *model=[HabitModel createNew];
    return cell;
}
//Layout
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
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
