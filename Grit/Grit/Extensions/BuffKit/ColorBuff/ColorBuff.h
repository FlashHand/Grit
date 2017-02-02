//
//  ColorBuff.h
//
//  Created by BoWang on 16/5/12.
//  Copyright (c) 2016 BoWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIColor (ColorBuff)
+(UIColor *)colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;
+(UIColor *)colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
-(NSString *)hexString;

-(UIColor *)colorWithAlpha:(CGFloat)alpha;

-(NSInteger)red;
-(NSInteger)green;
-(NSInteger)blue;
-(CGFloat)alpha;

-(UIColor *)reversedColor;

@end
#pragma mark - Theme Color
#define kColor_Theme_Green   [UIColor colorWithHex:0x65c294 alpha:1]
#define kColor_Theme_Green2   [UIColor colorWithHex:0xfeb74d alpha:1]


#pragma mark - Text Color

#define kColor_Text_DarkGrey    [UIColor colorWithHex:0x333333 alpha:1]
#define kColor_Text_LightGrey   [UIColor colorWithHex:0x999999 alpha:1]
#define kColor_Text_MiddleGrey  [UIColor colorWithHex:0x666666 alpha:1]

#pragma mark - Line Color
#define kColor_Line_LightGrey   [UIColor colorWithHex:0xcccccc alpha:1]

@interface ColorBuff : NSObject
@end
