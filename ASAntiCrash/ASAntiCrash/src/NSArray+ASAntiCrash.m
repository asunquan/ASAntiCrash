//
//  NSArray+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSArray+ASAntiCrash.h"

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSArray (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^
    {
        [NSArray as_swizzlingClassMethod:@selector(arrayWithObject:) to:@selector(as_arrayWithObject:)];
        [NSArray as_swizzlingClassMethod:@selector(arrayWithObjects:count:) to:@selector(as_arrayWithObjects:count:)];
        
        [self.clsNSArray as_swizzlingInstanceMethod:@selector(objectsAtIndexes:) to:@selector(as_objectsAtIndexes:)];
        [self.clsNSArray as_swizzlingInstanceMethod:@selector(getObjects:range:) to:@selector(as_arrayGetObjects:range:)];
        
        [self.clsNSPlaceholderArray as_swizzlingInstanceMethod:@selector(initWithObjects:count:) to:@selector(as_initWithObjects:count:)];
        
        if (UIDevice.currentDevice.systemVersion.floatValue >= 9.0f)
        {
            [self.clsNSArray0 as_swizzlingInstanceMethod:@selector(objectAtIndex:) to:@selector(as_array0ObjectAtIndex:)];
            [self.clsNSArray0 as_swizzlingInstanceMethod:@selector(objectAtIndexedSubscript:) to:@selector(as_objectAtIndexedSubscript:)];
            [self.clsNSArray0 as_swizzlingInstanceMethod:@selector(subarrayWithRange:) to:@selector(as_subarrayWithRange:)];
        }
        
        if (UIDevice.currentDevice.systemVersion.floatValue >= 10.0f)
        {
            [self.clsNSSingleObjectArrayI as_swizzlingInstanceMethod:@selector(objectAtIndex:) to:@selector(as_singleObjectArrayIObjectAtIndex:)];
            [self.clsNSSingleObjectArrayI as_swizzlingInstanceMethod:@selector(objectAtIndexedSubscript:) to:@selector(as_objectAtIndexedSubscript:)];
            [self.clsNSSingleObjectArrayI as_swizzlingInstanceMethod:@selector(subarrayWithRange:) to:@selector(as_subarrayWithRange:)];
            [self.clsNSSingleObjectArrayI as_swizzlingInstanceMethod:@selector(getObjects:range:) to:@selector(as_singleObjectArrayIGetObjects:range:)];
        }
        
        // 有问题, 原因未发现
        if (UIDevice.currentDevice.systemVersion.floatValue >= 11.0f)
        {
            [self.clsNSArrayI as_swizzlingInstanceMethod:@selector(objectAtIndexedSubscript:) to:@selector(as_arrayIObjectAtIndexedSubscript:)];
        }
        
        [self.clsNSArrayI as_swizzlingInstanceMethod:@selector(objectAtIndex:) to:@selector(as_arrayIObjectAtIndex:)];
        [self.clsNSArrayI as_swizzlingInstanceMethod:@selector(subarrayWithRange:) to:@selector(as_subarrayWithRange:)];
        [self.clsNSArrayI as_swizzlingInstanceMethod:@selector(getObjects:range:) to:@selector(as_arrayIGetObjects:range:)];
        [self.clsNSArrayI as_swizzlingInstanceMethod:@selector(arrayByAddingObject:) to:@selector(as_arrayIByAddingObject:)];
        [self.clsNSArrayI as_swizzlingInstanceMethod:@selector(arrayByAddingObjectsFromArray:) to:@selector(as_arrayIByAddingObjectsFromArray:)];
    });
}

#pragma mark - class cls

+ (Class)clsNSArray
{
    return objc_getClass("NSArray");
}

+ (Class)clsNSArrayI
{
    return objc_getClass("__NSArrayI");
}

+ (Class)clsNSArray0
{
    return objc_getClass("__NSArray0");
}

+ (Class)clsNSPlaceholderArray
{
    return objc_getClass("__NSPlaceholderArray");
}

+ (Class)clsNSSingleObjectArrayI
{
    return objc_getClass("__NSSingleObjectArrayI");
}

#pragma mark - arrayWithObject:

+ (instancetype)as_arrayWithObject:(id)anObject
{
    id instance = nil;
    
    @try
    {
        instance = [self as_arrayWithObject:anObject];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        instance = @[];
    }
    @finally
    {
        return instance;
    }
}

#pragma mark - arrayWithObjects:count:

+ (instancetype)as_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt
{
    id instance = nil;
    
    @try
    {
        instance = [self as_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return instance;
    }
}

#pragma mark - initWithObjects:count:

- (instancetype)as_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
    id instance = nil;
    
    @try
    {
        instance = [self as_initWithObjects:objects count:cnt];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return instance;
    }
}

#pragma mark - objectAtIndex:

// __NSArrayI  objectAtIndex:
- (id)as_arrayIObjectAtIndex:(NSUInteger)index
{
    id object = nil;
    
    @try
    {
        object = [self as_arrayIObjectAtIndex:index];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return object;
    }
}

// __NSSingleObjectArrayI objectAtIndex:
- (id)as_singleObjectArrayIObjectAtIndex:(NSUInteger)index
{
    id object = nil;
    
    @try
    {
        object = [self as_singleObjectArrayIObjectAtIndex:index];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return object;
    }
}

// __NSArray0 objectAtIndex:
- (id)as_array0ObjectAtIndex:(NSUInteger)index
{
    id object = nil;
    
    @try
    {
        object = [self as_array0ObjectAtIndex:index];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return object;
    }
}

#pragma mark - objectsAtIndexes:

- (NSArray *)as_objectsAtIndexes:(NSIndexSet *)indexes
{
    NSArray *returnArray = nil;
    
    @try
    {
        returnArray = [self as_objectsAtIndexes:indexes];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return returnArray;
    }
}

#pragma mark - objectAtIndexedSubscript:

- (id)as_objectAtIndexedSubscript:(NSUInteger)idx
{
    id object = nil;
    
    @try
    {
        object = [self as_objectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return object;
    }
}

- (id)as_arrayIObjectAtIndexedSubscript:(NSUInteger)idx
{
    id object = nil;
    
    @try
    {
        object = [self as_arrayIObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return object;
    }
}

#pragma mark - subarrayWithRange:

- (NSArray<id> *)as_subarrayWithRange:(NSRange)range
{
    if (range.location + range.length <= self.count)
    {
        return [self as_subarrayWithRange:range];
    }
    else if (range.location < self.count)
    {
        return [self as_subarrayWithRange:NSMakeRange(range.location, self.count-range.location)];
    }
    return nil;
}

#pragma mark - getObjects:range:

// NSArray getObjects:range:
- (void)as_arrayGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
{
    @try
    {
        [self as_arrayGetObjects:objects range:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

// __NSSingleObjectArrayI  getObjects:range:
- (void)as_singleObjectArrayIGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
{
    @try
    {
        [self as_singleObjectArrayIGetObjects:objects range:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

// __NSArrayI  getObjects:range:
- (void)as_arrayIGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
{
    @try
    {
        [self as_arrayIGetObjects:objects range:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - arrayByAddingObject:

- (NSArray<id> *)as_arrayIByAddingObject:(id)anObject
{
    NSArray *array = nil;
    
    @try
    {
        array = [self as_arrayIByAddingObject:anObject];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return array;
    }
}

#pragma mark - arrayByAddingObjectsFromArray:

- (NSArray<id> *)as_arrayIByAddingObjectsFromArray:(NSArray<id> *)otherArray
{
    NSArray *array = nil;
    
    @try
    {
        array = [self as_arrayIByAddingObjectsFromArray:otherArray];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return array;
    }
}

@end
