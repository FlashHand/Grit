//
//  CreateViewController.h
//  Grit
//
//  Created by BoWang on 2017/2/14.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HabitModel.h"
#import "EditViewController.h"
@interface CreateViewController : UIViewController
PC CompletionBlock compBlock;
- (instancetype)initWithType:(HabitType )type callBack:(CompletionBlock)callBack;
@end
