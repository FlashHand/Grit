//
//  CALayer+Extension.h
//  shiji
//
//  Created by BoWang on 16/11/1.
//  Copyright © 2016年 com.dtfunds. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Extension)
-(void)ext_setCornerRadius:(CGFloat )radius;
-(void)ext_setCornerRadius:(CGFloat )radius borderColor:(UIColor *)color;
@end
