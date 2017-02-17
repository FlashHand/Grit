//
//  FastMethod.m
//  Grit
//
//  Created by BoWang on 2017/1/27.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import "FastMethod.h"
NSString *fast_local(NSString *key){
    NSString *localized=NSLocalizedString(key, nil);
    return localized;
}

