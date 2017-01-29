//
//  EditViewController.h
//  Grit
//
//  Created by BoWang on 2017/1/28.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HabitModel.h"
typedef NS_ENUM(NSInteger,HabitType){
    HabitTypeNonlinear = 0,
    HabitTypeLinear = 1
};
typedef void (^CompletionBlock)(HabitModel *model);
@interface EditViewController : UIViewController
PC CompletionBlock compBlock;
- (instancetype)initWithType:(HabitType )type callBack:(CompletionBlock)callBack edit:(BOOL)isEdit;
@end
