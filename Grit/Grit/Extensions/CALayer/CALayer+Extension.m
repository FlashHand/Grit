//
//  CALayer+Extension.m
//  shiji
//
//  Created by BoWang on 16/11/1.
//  Copyright © 2016年 com.dtfunds. All rights reserved.
//

#import "CALayer+Extension.h"

@implementation CALayer (Extension)

-(void)ext_setCornerRadius:(CGFloat )radius{
    [self setMasksToBounds:YES];
    [self setBorderWidth:0];
    [self setBorderColor:[UIColor clearColor].CGColor];
    [self setCornerRadius:radius];
}
-(void)ext_setCornerRadius:(CGFloat )radius borderColor:(UIColor *)color{
    [self setMasksToBounds:YES];
    [self setBorderWidth:1];
    [self setBorderColor:color.CGColor];
    [self setCornerRadius:radius];
}
+(CALayer *)ext_lineLayerWithOrigin:(CGPoint)lineOrigin length:(CGFloat)lineLength color:(UIColor *) lineColor isPortrait:(BOOL)isPortrait{
    CALayer *lineLayer=[CALayer new];
    [lineLayer setBackgroundColor:lineColor.CGColor];
    if (!lineColor) {
        lineColor=kColor_Line_LightGrey ;
    }
    if (isPortrait) {
        [lineLayer setFrame:CGRectMake(lineOrigin.x, lineOrigin.y, 1/kMeasure_Scale, lineLength)];
    }
    else
    {
        [lineLayer setFrame:CGRectMake(lineOrigin.x, lineOrigin.y, lineLength, 1/kMeasure_Scale)];
    }
    return lineLayer;
}
@end
