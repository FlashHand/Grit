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
}
@end

@implementation HabitListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    titleLabel = [YYLabel new];
    [titleLabel setFont:fast_font_semibold(20)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:kColor_Text_DarkGrey];
    descLabel = [YYLabel new];
    [descLabel setFont:fast_font_regular(15)];
    [descLabel setTextColor:kColor_Text_MiddleGrey];
    [descLabel setNumberOfLines:0];
    [descLabel setLineBreakMode:NSLineBreakByWordWrapping];
    deleteButton = [UIButton new];
    editButton = [UIButton new];
    logButton = [UIButton new];
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

    return self;
}
-(void)layoutSubviews{
    
}
-(void)setHabit:(HabitModel *)habit{
    _habit=habit;
    
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
