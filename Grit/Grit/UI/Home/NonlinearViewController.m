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
#import "CreateViewController.h"
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
        [addButton setBackgroundColor:kColor_Theme_Green2];
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
            [self goAdd];
        }];
    }
    return _addButton;
}
-(UITableView *)tableView{
    if (!_tableViewNonlinear) {
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectNull style:UITableViewStylePlain];
        [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.view addSubview:_tableViewNonlinear=tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).with.offset(0);
            make.left.equalTo(self.view.mas_left).with.offset(0);
            make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
            make.right.equalTo(self.view.mas_right).with.offset(0);
        }];
        [tableView registerClass:[HabitListCell class] forCellReuseIdentifier:cellId];
        [tableView setDelegate:self];
        [tableView setDataSource:self];
        [tableView setContentInset:UIEdgeInsetsMake(0, 0, 65, 0)];
    }
    return _tableViewNonlinear;
}
#pragma mark - Actions
-(void)goEdit{
    EditViewController *evc=[[EditViewController alloc]initWithType:HabitTypeNonlinear callBack:^(HabitModel *model) {
        
    }];
    [self.navigationController pushViewController:evc animated:YES];
}
-(void)goAdd{
    CreateViewController *cvc=[[CreateViewController alloc]initWithType:HabitTypeNonlinear callBack:^(HabitModel *model) {
        
    }];
    [self.navigationController pushViewController:cvc animated:YES];
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
    HabitModel *model=[HabitModel createMock];
    [cell setHabit:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGPoint convertedPoint=[cell convertPoint:CGPointMake(0, 0) toView:self.view];
    if ((convertedPoint.y>self.view.height-cell.height)||(convertedPoint.y<0)) {
        CATransform3D initialTransform=CATransform3DIdentity;
        initialTransform.m11=0.5;
        initialTransform.m22=0.5;
        cell.layer.opacity=0;
        cell.layer.transform=initialTransform;
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            cell.layer.transform=CATransform3DIdentity;
            cell.layer.opacity=1;
        } completion:^(BOOL finished) {
        }  ];
    }
}
//Layout
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 265;
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
