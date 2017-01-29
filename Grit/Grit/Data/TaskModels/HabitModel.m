//
//  HabitModel.m
//  Grit
//
//  Created by BoWang on 2017/1/28.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "HabitModel.h"

@implementation HabitModel
+ (NSString *)primaryKey {
    return @"id";
}
+(HabitModel *)createNew{
    HabitModel *model=[HabitModel new];
    return model;
}
+(HabitModel *)createMock{
    HabitModel *model=[HabitModel createNew];
    return model;
}
@end
