//
//  HabitListCell.m
//  Grit
//
//  Created by BoWang on 2017/1/28.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "HabitListCell.h"
#import <YYText/YYText.h>

@interface HabitListCell ()
{
    YYLabel *titleLabel;
    YYLabel *descLabel;
    UIButton *deleteButton;
    UIButton *editButton;
    UIButton *logButton;
    CAGradientLayer *logLayer;
    YYLabel *progressLabel;//目标百分比，当前百分比
    YYLabel *allTimeLabel;//开始时间 至今 完成OR打断次数
    CATextLayer *statusNameLayer;
    CALayer *separator;
}
@end

@implementation HabitListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone]; 
    titleLabel = [YYLabel new];
    
    [titleLabel setFont:fast_font_semibold(20)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:kColor_Text_DarkGrey];
    descLabel = [YYLabel new];
    [descLabel setFont:fast_font_regular(15)];
    [descLabel setTextColor:kColor_Text_MiddleGrey];
    [descLabel setNumberOfLines:2];
    [descLabel setLineBreakMode:NSLineBreakByWordWrapping];
    deleteButton = [UIButton new];
    [deleteButton setTitle:fast_local(@"Delete") forState:UIControlStateNormal];
    editButton = [UIButton new];
    [editButton setTitle:fast_local(@"Edit") forState:UIControlStateNormal];

    logButton = [UIButton new];
//    [logButton setTitle:fast_local(@"Delete") forState:UIControlStateNormal];
    NSArray *btns=@[deleteButton,editButton,logButton];
    for (UIButton *btn in btns) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:kColor_Theme_Green];
        [btn.layer ext_setCornerRadius:4];
        
    }
    logLayer = [CAGradientLayer new];
    [logLayer setBackgroundColor:kColor_Bg_LightGrey.CGColor];
    [logLayer setStartPoint:CGPointMake(0, 0.5)];
    [logLayer setEndPoint:CGPointMake(1, 0.5)];
    statusNameLayer = [CATextLayer new];
    [statusNameLayer setContentsScale:kMeasure_Scale];
    [statusNameLayer setAlignmentMode:kCAAlignmentLeft];
    [statusNameLayer setFontSize:20];
    [statusNameLayer setForegroundColor:kColor_Theme_Orange.CGColor];
    progressLabel = [YYLabel new];
    [progressLabel setBackgroundColor:kColor_Bg_LightGrey];
    allTimeLabel = [YYLabel new];
    [allTimeLabel setBackgroundColor:kColor_Bg_LightGrey];

    [self.contentView addSubview:titleLabel];
    [self.contentView addSubview:descLabel];
    [self.contentView addSubview:deleteButton];
    [self.contentView addSubview:editButton];
    [self.contentView addSubview:logButton];
    [self.contentView.layer addSublayer:logLayer];
    [self.contentView.layer addSublayer:statusNameLayer];
    [self.contentView addSubview:progressLabel];
    [self.contentView addSubview:allTimeLabel];
    [self makeMock];
    separator=[CALayer new];
    [separator  setBackgroundColor:kColor_Line_LightGrey.CGColor];
    [self.contentView .layer addSublayer:separator];
    return self;
}
-(void)makeMock{
    [titleLabel setText:@"Writing code everyday"];
    [descLabel setText:@"Keep your mind sharp\nKeep your mind sharp"];
}
-(void)layoutSubviews{
    CGFloat margin=15.0;
    CGFloat spaceW=20.0;
    CGFloat spaceH=5.0;
    
    //宽度
    CGFloat w0=self.contentView.width;//进展情况描述
    CGFloat w1=self.contentView.width-2*margin;//标题&描述
    CGFloat w2=(self.contentView.width-2*margin-2*spaceW)/3;//按钮宽度
    //高度
    CGFloat h1=40;
    CGFloat h2=50;
    CGFloat h3=30;
    CGFloat h4=10;
    CGFloat h5=20;


    //y坐标
    CGFloat y1=spaceH;//标题
    CGFloat y2=y1+h1+spaceH;//描述
    CGFloat y3=y2+h2+spaceH;//按钮
    CGFloat y4=y3+h3+spaceH;//进度条
    CGFloat y5=y4+h4+spaceH;//进展情况描述
    
    [titleLabel setFrame:CGRectMake(margin, y1, w1, h1)];
    [descLabel setFrame:CGRectMake(margin, y2, w1, h2)];
    
    [deleteButton setFrame:CGRectMake(margin, y3, w2, h3)];
    [editButton setFrame:CGRectMake(deleteButton.right+spaceW, y3, w2, h3)];
    [logButton setFrame:CGRectMake(editButton.right+spaceW, y3, w2, h3)];
    [logLayer setFrame:CGRectMake(margin, y4, w1, h4)];
    [statusNameLayer setFrame:CGRectMake(margin, y5, w1, h5)];
    [progressLabel setFrame:CGRectMake(margin, y5+h3+5, w1, h3)];
    [allTimeLabel setFrame:CGRectMake(margin, y5+2*(h3+5), w1, h3)];
    
    [separator setFrame:CGRectMake(0, self.contentView.height-0.5, self.contentView.width, 0.5)];
    
    
}
-(void)setHabit:(HabitModel *)habit{
    _habit=habit;
    
    NSString *logStr=@"";
    NSString *statusName=@"";
    
    switch (habit.m_type) {
        case 0:
            logStr=@"Fullfill";
            statusName=@"FullfillLevel";
            break;
        case 1:
            logStr=@"Break";
            statusName=@"BreakRate";
            break;
        default:
            break;
    }
    [logButton setTitle:fast_local(logStr) forState:UIControlStateNormal];
    [statusNameLayer setString:statusName];
    [self drawGradient];
    [self showProgressDesc];
    
}
-(void)drawGradient{
    NSMutableArray *colors=[NSMutableArray new];
    NSMutableArray *locs=[NSMutableArray new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0;i<1000;i++){
            NSNumber *num=[NSNumber numberWithFloat:0.001];
            [locs addObject:num];
            if (i%17==0){
                [colors addObject:(id)[UIColor redColor].CGColor];
            }
            else{
                [colors addObject:(id)kColor_Theme_Green.CGColor];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [logLayer setColors:colors];
            [logLayer setLocations:locs];
        });
    });
}
-(void)showProgressDesc{
    //Progress
    if (_habit.m_type==0) {
        float target=0.9;
        float cur=0.8;
        NSString *targetPer=[NSString stringWithFormat:@"%.0f%%",target*100];
        NSString *curPer=[NSString stringWithFormat:@"%.0f%%",cur*100];
        //未实现目标
        UIColor *curColor=target>cur?[UIColor redColor]:kColor_Theme_Green;
        NSString *targetStr=[NSString stringWithFormat:@"%@:%@   %@:%@",fast_local(@"TargetLevel"),targetPer,fast_local(@"CurrentLevel"),curPer];
        NSMutableAttributedString *attr1=[[NSMutableAttributedString alloc]initWithString:targetStr];
        [attr1 setYy_color:kColor_Text_MiddleGrey];
        
        [progressLabel setAttributedText:attr1];
        NSString *allTimeStr=[NSString stringWithFormat:@"%@:%@   %@:%@   %@:%@",fast_local(@"Start at"),@"2016-01-01",fast_local(@"Till now"),@"100(d)",fast_local(@"Fullfilled days"),@"100(d)"];
        NSMutableAttributedString *attr2=[[NSMutableAttributedString alloc]initWithString:allTimeStr];
        [attr2 setYy_color:kColor_Text_MiddleGrey];
        
        [allTimeLabel setAttributedText:attr2];
    }
    //AllTime
    else{
        float target=0.9;
        float cur=0.8;
        NSString *targetPer=[NSString stringWithFormat:@"%.0f%%",target*100];
        NSString *curPer=[NSString stringWithFormat:@"%.0f%%",cur*100];
        //未实现目标
        UIColor *curColor=target>cur?[UIColor redColor]:kColor_Theme_Green;
        NSString *targetStr=[NSString stringWithFormat:@"%@:%@   %@:%@",fast_local(@"TargetLevel"),targetPer,fast_local(@"CurrentLevel"),curPer];
        NSMutableAttributedString *attr1=[[NSMutableAttributedString alloc]initWithString:targetStr];
        [attr1 setYy_color:kColor_Text_MiddleGrey];
        
        [progressLabel setAttributedText:attr1];
        NSString *allTimeStr=[NSString stringWithFormat:@"%@:%@   %@:%@   %@:%@",fast_local(@"Start at"),@"2016-01-01",fast_local(@"Till now"),@"100(d)",fast_local(@"Fullfilled days"),@"100(d)"];
        NSMutableAttributedString *attr2=[[NSMutableAttributedString alloc]initWithString:allTimeStr];
        [attr2 setYy_color:kColor_Text_MiddleGrey];
        
        [allTimeLabel setAttributedText:attr2];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
