//
//  NSObject+ASSwizzling.h
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ASSwizzling)

+ (void)as_swizzlingInstanceMethod:(SEL)sourceSEL to:(SEL)newSEL;

+ (void)as_swizzlingClassMethod:(SEL)sourceSEL to:(SEL)newSEL;

@end
