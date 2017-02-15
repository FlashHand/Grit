//
//  CreateViewController.m
//  Grit
//
//  Created by BoWang on 2017/2/14.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController ()<UITextFieldDelegate,UITextViewDelegate>
{
    UIButton *_lastButton;
    UIButton *_nextButton;
    UITextField *_titleField;
    UITextView *_descTextView;
    UITextField *_targetField;
    HabitType _type;
}
@end

@implementation CreateViewController
#pragma mark - Life Cycle
- (instancetype)initWithType:(HabitType )type callBack:(CompletionBlock)callBack{
    self = [super init];
    _compBlock=callBack;
    _type=type;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSString *title=nil;
    NSString *statusStr=fast_local(@"Add");
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
-(UIButton *)lastButton{
    if (!_lastButton) {
        
    }
    return _lastButton;
}
-(UIButton *)nextButton{
    if (!_nextButton) {
        
    }
    return _nextButton;
}
-(UITextField *)titleField{
    if (!_titleField) {
        
    }
    return _titleField;
}
-(UITextView *)descTextView{
    if (!_descTextView) {
        
    }
    return _descTextView;
}
-(UITextField *)targetField{
    if (!_targetField) {
        
    }
    return _targetField;
}
@end
