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
}
@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
