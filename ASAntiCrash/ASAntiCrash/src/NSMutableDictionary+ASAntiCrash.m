//
//  NSMutableDictionary+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSMutableDictionary+ASAntiCrash.h"

#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSMutableDictionary (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [self.clsNSDictionaryM as_swizzlingInstanceMethod:@selector(setObject:forKey:) to:@selector(as_setObject:forKey:)];
        
        [self.clsNSDictionaryM as_swizzlingInstanceMethod:@selector(setObject:forKeyedSubscript:) to:@selector(as_setObject:forKeyedSubscript:)];
        
        [self.clsNSDictionaryM as_swizzlingInstanceMethod:@selector(objectForKey:) to:@selector(as_objectForKey:)];
        
        [self.clsNSDictionaryM as_swizzlingInstanceMethod:@selector(removeObjectForKey:) to:@selector(as_removeObjectForKey:)];
    });
}

#pragma mark - class cluster

+ (Class)clsNSDictionaryM
{
    return objc_getClass("__NSDictionaryM");
}

#pragma mark - setObject:forKey:

- (void)as_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    @try
    {
        [self as_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - setObject:forKeyedSubscript:

- (void)as_setObject:(id)obj forKeyedSubscript:(NSString *)key
{
    @try
    {
        [self as_setObject:obj forKeyedSubscript:key];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - objectForKey:

- (id)as_objectForKey:(id)aKey
{
    id obj = nil;
    
    @try
    {
        obj = [self as_objectForKey:aKey];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return obj;
    }
}

#pragma mark - removeObjectForKey:

- (void)as_removeObjectForKey:(id)aKey
{
    @try
    {
        [self as_removeObjectForKey:aKey];
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
