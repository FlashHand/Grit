//
//  FontBuff.m
//  Grit
//
//  Created by BoWang on 2017/1/27.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "FontBuff.h"

@implementation FontBuff
@end
UIFont *fast_font_regular(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular];
    return font;
}
UIFont *fast_font_ultraLight(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightUltraLight];
    return font;
}
UIFont *fast_font_thin(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightThin];
    return font;
}
UIFont *fast_font_medium(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium  ];
    return font;
}
UIFont *fast_font_semibold(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightSemibold];
    return font;
}
UIFont *fast_font_bold(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightBold];
    return font;
}
UIFont *fast_font_heavy(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightHeavy];
    return font;
}
UIFont *fast_font_black(NSUInteger fontSize){
    UIFont *font=[UIFont systemFontOfSize:fontSize weight:UIFontWeightBlack];
    return font;
}
