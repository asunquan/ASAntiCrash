//
//  NSMutableSet+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSMutableSet+ASAntiCrash.h"

#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSMutableSet (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [self.clsNSSetM as_swizzlingInstanceMethod:@selector(addObject:) to:@selector(as_addObject:)];
        
        [self.clsNSSetM as_swizzlingInstanceMethod:@selector(removeObject:) to:@selector(as_removeObject:)];
    });
}

#pragma mark - class cluster

+ (Class)clsNSSetM
{
    return objc_getClass("__NSSetM");
}

#pragma mark - addObject:

- (void)as_addObject:(id)object
{
    @try
    {
        [self as_addObject:object];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - removeObject:

- (void)as_removeObject:(id)object
{
    @try
    {
        [self as_removeObject:object];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

@end
