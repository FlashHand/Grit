//
//  FontBuff.h
//  Grit
//
//  Created by BoWang on 2017/1/27.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FontBuff : NSObject

@end

UIFont *fast_font_regular(NSUInteger fontSize);
UIFont *fast_font_ultraLight(NSUInteger fontSize);
UIFont *fast_font_thin(NSUInteger fontSize);
UIFont *fast_font_medium(NSUInteger fontSize);
UIFont *fast_font_semibold(NSUInteger fontSize);
UIFont *fast_font_bold(NSUInteger fontSize);
UIFont *fast_font_heavy(NSUInteger fontSize);
UIFont *fast_font_black(NSUInteger fontSize);

