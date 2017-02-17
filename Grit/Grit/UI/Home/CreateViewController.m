//
//  CreateViewController.m
//  Grit
//
//  Created by BoWang on 2017/2/14.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "CreateViewController.h"
#import "IQKeyboardManager.h"
@interface CreateViewController ()<UITextFieldDelegate,UITextViewDelegate,UIScrollViewDelegate>
PS UIButton *lastButton;
PS UIButton *nextButton;
PS UITextField *titleField;
PS UITextView *descTextView;
PS UITextField *targetField;
PA HabitType type;
PS UIScrollView *pagedView;
PS UIPageControl *pageControl;
PS UIToolbar *toolView;
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
    [self.view addSubview:[UIView new]];
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
    
    _pagedView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height-64)];
    [_pagedView setContentSize:CGSizeMake(_pagedView.width*3, _pagedView.height)];
    [_pagedView setPagingEnabled:YES];
    [_pagedView setDelegate:self];
    [_pagedView setShowsHorizontalScrollIndicator:NO];
    [_pagedView setShowsVerticalScrollIndicator:NO];
    [_pagedView setDirectionalLockEnabled:YES];
    [self.view addSubview:_pagedView];
    
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    [_pageControl setBackgroundColor:[UIColor whiteColor]];
    [_pageControl.layer ext_setCornerRadius:10];
    [_pageControl setCenter:CGPointMake(self.view.width/2,64+20)];
    [self.view addSubview:_pageControl];
    [_pageControl setNumberOfPages:3];
    [_pageControl setPageIndicatorTintColor:kColor_Bg_LightGrey];
    [_pageControl setCurrentPageIndicatorTintColor:kColor_Theme_Green];
    [_pageControl setEnabled:NO];
    
    [self titleField];
    [self descTextView];
    [self targetField];

    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [_titleField becomeFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UI
-(UIToolbar *)toolView{
    if (!_toolView) {
        _toolView=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
        [_toolView addSubview:self.lastButton];
        [_toolView addSubview:self.nextButton];
    }
    return _toolView;
}
-(UIButton *)lastButton{
    if (!_lastButton) {
        _lastButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 60, 30)];
        [_lastButton setTitleColor:kColor_Theme_Green forState:UIControlStateNormal];
        [_lastButton setTitleColor:kColor_Text_LightGrey forState:UIControlStateDisabled];

        [_lastButton setTitle:fast_local(@"Last") forState:UIControlStateNormal];
        [_lastButton setCenterX:self.toolView.width/2-70];
        [_lastButton setEnabled:NO];
        @weakify(self);
        [[_lastButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            @strongify(self);
            if (self.pageControl.currentPage>0) {
                [self.pagedView setContentOffset:CGPointMake((self.pageControl.currentPage-1)*self.view.width, 0) animated:YES];

            }
        }];
    }
    return _lastButton;
}
-(UIButton *)nextButton{
    if (!_nextButton) {
        _nextButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 60, 30)];
        [_nextButton setTitleColor:kColor_Theme_Green forState:UIControlStateNormal];
        [_nextButton setTitleColor:kColor_Text_LightGrey forState:UIControlStateDisabled];

        [_nextButton setTitle:fast_local(@"Next") forState:UIControlStateNormal];
        [_nextButton setCenterX:self.toolView.width/2+70];
        @weakify(self);
        [[_nextButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            @strongify(self);
            if (self.pageControl.currentPage<2) {
                [self.pagedView setContentOffset:CGPointMake((self.pageControl.currentPage+1)*self.view.width, 0) animated:YES];
               
            }
        }];

    }
    return _nextButton;
}
-(UITextField *)titleField{
    if (!_titleField) {
        _titleField=[[UITextField alloc]initWithFrame:CGRectMake(15, 70, self.view.width-30, 30)];
        [_titleField setBackgroundColor:[UIColor whiteColor]];
        [_titleField setTextAlignment:NSTextAlignmentCenter];
        [_titleField setReturnKeyType:UIReturnKeyNext];
        [_titleField setInputAccessoryView:self.toolView];
        [_titleField.layer addSublayer:[CALayer ext_lineLayerWithOrigin:CGPointMake(0, _titleField.height-0.5) length:_titleField.width color:kColor_Line_LightGrey isPortrait:NO]];
        [_pagedView addSubview:_titleField];
        UILabel *titleDescLabel=[[UILabel alloc]initWithFrame:CGRectMake(_titleField.left,_titleField.top-30, _titleField.width, 20)];
        [titleDescLabel setFont:fast_font_semibold(16)];
        [titleDescLabel setTextColor:kColor_Theme_Green];
        [titleDescLabel setTextAlignment:NSTextAlignmentCenter];
        [titleDescLabel setText:fast_local(@"TitleDesc")];
        [_pagedView addSubview:titleDescLabel];
    }
    return _titleField;
}
-(UITextView *)descTextView{
    if (!_descTextView) {
        _descTextView=[[UITextView alloc]initWithFrame:CGRectMake(self.view.width+15, 70, self.view.width-30, 80) textContainer:nil];
        [_descTextView setDelegate:self];
        [_descTextView setReturnKeyType:UIReturnKeyNext];
        [_descTextView setInputAccessoryView:self.toolView];

        [_pagedView addSubview:_descTextView];
        [_descTextView.layer addSublayer:[CALayer ext_lineLayerWithOrigin:CGPointMake(0, _descTextView.height-0.5) length:_descTextView.width color:kColor_Line_LightGrey isPortrait:NO]];

        UILabel *descRemindLabel=[[UILabel alloc]initWithFrame:CGRectMake(_descTextView.left,_descTextView.top-30, _descTextView.width, 20)];
        [descRemindLabel setFont:fast_font_semibold(16)];
        [descRemindLabel setTextColor:kColor_Theme_Green];
        [descRemindLabel setTextAlignment:NSTextAlignmentCenter];
        [descRemindLabel setText:fast_local(@"HabitDesc")];
        [_pagedView addSubview:descRemindLabel];
    }
    return _descTextView;
}
-(UITextField *)targetField{
    if (!_targetField) {
        _targetField=[[UITextField alloc]initWithFrame:CGRectMake(self.view.width*2+15, 70, self.view.width-30, 30)];
        [_targetField setBackgroundColor:[UIColor whiteColor]];
        [_targetField setTextAlignment:NSTextAlignmentCenter];
        [_targetField setReturnKeyType:UIReturnKeyNext];
        [_targetField setKeyboardType:UIKeyboardTypeDecimalPad];
        [_targetField setInputAccessoryView:self.toolView];
        [_targetField.layer addSublayer:[CALayer ext_lineLayerWithOrigin:CGPointMake(0, _titleField.height-0.5) length:_titleField.width color:kColor_Line_LightGrey isPortrait:NO]];
        [_pagedView addSubview:_targetField];
        UILabel *targetDescLabel=[[UILabel alloc]initWithFrame:CGRectMake(_targetField.left,_targetField.top-30, _targetField.width, 20)];
        [targetDescLabel setFont:fast_font_semibold(16)];
        [targetDescLabel setTextColor:kColor_Theme_Green];
        [targetDescLabel setTextAlignment:NSTextAlignmentCenter];
        [targetDescLabel setText:fast_local(@"TargetDesc")];
        [_pagedView addSubview:targetDescLabel];
    }
    return _targetField;
}
#pragma mark - Actions
-(void)updatePage{
    int page = (int)(self.pagedView.contentOffset.x/self.view.width);
   
        switch (page) {
            case 0:
            [_descTextView resignFirstResponder];
            [_titleField becomeFirstResponder];
            break;
            case 1:
            [_targetField resignFirstResponder];
            [_titleField resignFirstResponder];
            [_descTextView becomeFirstResponder];
            break;
            case 2:
            [_descTextView resignFirstResponder];
            [_targetField becomeFirstResponder];
            break;
            default:
            break;
        }
    [_lastButton setEnabled:self.pagedView.contentOffset.x>=self.view.width?YES:NO];
    [_nextButton setEnabled:self.pagedView.contentOffset.x>=2*self.view.width?NO:YES];
    [_pagedView setContentSize:CGSizeMake(_pagedView.width*3, _pagedView.height)];

}
#pragma mark - UIScrollView Delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,scrollView.frame.size.height);
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = (int)(self.pagedView.contentOffset.x/self.view.width);
    if (_pageControl.currentPage!=page) {
        [_pageControl setCurrentPage:page];
    }
    [scrollView setContentOffset: CGPointMake(scrollView.contentOffset.x, 0)];

    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updatePage];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self updatePage];

}

@end
