//
//  NSSet+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSSet+ASAntiCrash.h"

#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSSet (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [NSSet as_swizzlingClassMethod:@selector(setWithObject:) to:@selector(as_setWithObject:)];
    });
}

#pragma mark - setWithObject:

+ (instancetype)as_setWithObject:(id)object
{
    id set = nil;
    
    @try
    {
        set = [self as_setWithObject:object];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return set;
    }
}

@end
