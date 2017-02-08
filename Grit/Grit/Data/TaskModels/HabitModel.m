//
//  HabitModel.m
//  Grit
//
//  Created by BoWang on 2017/1/28.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "HabitModel.h"
@implementation FullfillLog
@end

@implementation HabitModel
+ (NSString *)primaryKey {
    return @"m_id";
}
+(HabitModel *)createNew{
    HabitModel *model=[HabitModel new];
    return model;
}
+(HabitModel *)createMock{
    HabitModel *model=[HabitModel createNew];
    NSDate *otherDay=[NSDate dateWithTimeIntervalSinceNow:-86400*100];
    [model setM_createDate:otherDay];
    [model setM_type:0];
    return model;
}
@end
