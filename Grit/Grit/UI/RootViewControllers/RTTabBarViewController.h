//
//  RTTabBarViewController.h
//  Grit
//
//  Created by BoWang on 2017/1/9.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTTabBarViewController : UITabBarController
+(RTTabBarViewController *)sharedSingleton;
-(void)loadVCs;
@end
