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
    progressLabel = [YYLabel new];
    allTimeLabel = [YYLabel new];
    [self.contentView addSubview:titleLabel];
    [self.contentView addSubview:descLabel];
    [self.contentView addSubview:deleteButton];
    [self.contentView addSubview:editButton];
    [self.contentView addSubview:logButton];
    [self.contentView.layer addSublayer:logLayer];
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

    //y坐标
    CGFloat y1=spaceH;//标题
    CGFloat y2=y1+h1+spaceH;//描述
    CGFloat y3=y2+h2+spaceH;//按钮
    CGFloat y4=y3+h3+spaceH;//进度条
    CGFloat y5=y4+h4+spaceH;//进展请款描述
    
    [titleLabel setFrame:CGRectMake(margin, y1, w1, h1)];
    [descLabel setFrame:CGRectMake(margin, y2, w1, h2)];
    
    [deleteButton setFrame:CGRectMake(margin, y3, w2, h3)];
    [editButton setFrame:CGRectMake(deleteButton.right+spaceW, y3, w2, h3)];
    [logButton setFrame:CGRectMake(editButton.right+spaceW, y3, w2, h3)];
    
    
    [separator setFrame:CGRectMake(0, self.contentView.height-0.5, self.contentView.width, 0.5)];
    
    
}
-(void)setHabit:(HabitModel *)habit{
    _habit=habit;
    
    NSString *logStr=@"";
    switch (habit.m_type) {
        case 1:
            logStr=@"Fullfill";
            break;
        case 2:
            logStr=@"Break";

            break;
        default:
            break;
    }
    
}
-(void)drawGradient{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0;i<1000;i++){
            
        }
    });
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
