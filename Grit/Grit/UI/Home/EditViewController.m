//
//  EditViewController.m
//  Grit
//
//  Created by BoWang on 2017/1/28.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
{
    HabitType _type;
    BOOL _isEdit;
}
@end

@implementation EditViewController
#pragma mark - Life Cycle
- (instancetype)initWithType:(HabitType )type callBack:(CompletionBlock)callBack edit:(BOOL)isEdit{
    self = [super init];
    _compBlock=callBack;
    _type=type;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSString *title=nil;
    NSString *statusStr=_isEdit?@"Edit":@"Add";
    switch (_type) {
        case HabitTypeNonlinear:{
            title=[NSString stringWithFormat:@"%@ - %@",fast_local(@"item1"),statusStr];
        }
            break;
        case HabitTypeLinear:{
            title=[NSString stringWithFormat:@"%@ - %@",fast_local(@"item2"),statusStr];
        }
            break;
        default:
            break;
    }
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:kColor_Theme_Green];
    [titleLabel setText:title];
    [titleLabel setFont:fast_font_semibold(20)];
    [self.navigationItem setTitleView:titleLabel];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UI

#pragma mark - Actions
-(void)confirm{
    HabitModel *model=[HabitModel createNew];
    _compBlock(model);
    _compBlock=nil;
    [self.navigationController popViewControllerAnimated:YES];
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
