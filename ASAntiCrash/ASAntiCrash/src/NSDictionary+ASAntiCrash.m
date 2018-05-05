//
//  NSDictionary+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSDictionary+ASAntiCrash.h"

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSDictionary (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^
    {
        [NSDictionary as_swizzlingClassMethod:@selector(dictionaryWithObject:forKey:) to:@selector(as_dictionaryWithObject:forKey:)];
        
        [NSDictionary as_swizzlingClassMethod:@selector(dictionaryWithObjects:forKeys:count:) to:@selector(as_dictionaryWithObjects:forKeys:count:)];
        
        [self.clsNSPlaceholderDictionary as_swizzlingInstanceMethod:@selector(initWithObjects:forKeys:count:) to:@selector(as_initWithObjects:forKeys:count:)];
        
        if (UIDevice.currentDevice.systemVersion.floatValue >= 10.0f)
        {
            [self.clsNSDictionaryI as_swizzlingInstanceMethod:@selector(objectForKey:) to:@selector(as_objectForKey:)];
        }
        
        [self.clsNSArraySingleEntryDictionaryI as_swizzlingInstanceMethod:@selector(objectForKey:) to:@selector(as_objectForKey:)];
        
        if (UIDevice.currentDevice.systemVersion.floatValue >= 9.0f)
        {
            [self.clsNSDictionary0 as_swizzlingInstanceMethod:@selector(objectForKey:) to:@selector(as_dictionary0ObjectForKey:)];
        }
    });
}

#pragma mark - class cluster

+ (Class)clsNSArraySingleEntryDictionaryI
{
    return objc_getClass("__NSArraySingleEntryDictionaryI");
}

+ (Class)clsNSDictionaryI
{
    return objc_getClass("__NSDictionaryI");
}

+ (Class)clsNSDictionary0
{
    return objc_getClass("__NSDictionary0");
}

+ (Class)clsNSPlaceholderDictionary
{
    return objc_getClass("__NSPlaceholderDictionary");
}

#pragma mark - dictionaryWithObject:forKey:

+ (instancetype)as_dictionaryWithObject:(id)object forKey:(id <NSCopying>)key
{
    id obj = nil;
    
    @try
    {
        obj = [self as_dictionaryWithObject:object forKey:key];
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

#pragma mark - dictionaryWithObjects:forKeys:count:

+ (instancetype)as_dictionaryWithObjects:(const id _Nonnull [_Nullable])objects forKeys:(const id _Nonnull [_Nullable])keys count:(NSUInteger)cnt
{
    id obj = nil;
    
    @try
    {
        obj = [self as_dictionaryWithObjects:objects forKeys:keys count:cnt];
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

#pragma mark - initWithObjects:forKeys:count:

- (instancetype)as_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
    id instance = nil;
    
    @try
    {
        instance = [self as_initWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        //处理错误的数据，然后重新初始化一个字典
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        if (objects && keys)
        {
            for (int i = 0; i < cnt; i++)
            {
                if (objects[i] && keys[i])
                {
                    newObjects[index] = objects[i];
                    newkeys[index] = keys[i];
                    index++;
                }
            }
        }
        
        instance = [self as_initWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally
    {
        return instance;
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

- (id)as_dictionary0ObjectForKey:(id)aKey
{
    id obj = nil;
    
    @try
    {
        obj = [self as_dictionary0ObjectForKey:aKey];
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

@end
