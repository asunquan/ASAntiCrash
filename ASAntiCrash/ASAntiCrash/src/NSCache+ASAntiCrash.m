//
//  NSCache+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSCache+ASAntiCrash.h"

#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSCache (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [NSCache as_swizzlingInstanceMethod:@selector(setObject:forKey:) to:@selector(as_setObject:forKey:)];
        
        [NSCache as_swizzlingInstanceMethod:@selector(setObject:forKey:cost:) to:@selector(as_setObject:forKey:cost:)];
    });
}

#pragma mark - setObject:forKey:

- (void)as_setObject:(id)obj forKey:(NSString*)key
{
    @try
    {
        [self as_setObject:obj forKey:key];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - setObject:forKey:cost:

- (void)as_setObject:(id)obj forKey:(NSString *)key cost:(NSUInteger)g
{
    @try
    {
        [self as_setObject:obj forKey:key cost:g];
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
