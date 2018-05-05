//
//  NSMutableArray+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSMutableArray+ASAntiCrash.h"

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSMutableArray (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^
    {
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(objectAtIndex:) to:@selector(as_objectAtIndex:)];
        
        if (UIDevice.currentDevice.systemVersion.floatValue >= 11.0f)
        {
            [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(objectAtIndexedSubscript:) to:@selector(as_objectAtIndexedSubscript:)];
        }
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(addObject:) to:@selector(as_addObject:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(insertObject:atIndex:) to:@selector(as_insertObject:atIndex:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(removeObjectAtIndex:) to:@selector(as_removeObjectAtIndex:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(removeObjectsAtIndexes:) to:@selector(as_removeObjectsAtIndexes:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(removeObjectsInRange:) to:@selector(as_removeObjectsInRange:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(replaceObjectAtIndex:withObject:) to:@selector(as_replaceObjectAtIndex:withObject:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(subarrayWithRange:) to:@selector(as_subarrayWithRange:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(setObject:atIndexedSubscript:) to:@selector(as_setObject:atIndexedSubscript:)];
        
        [self.clsNSArrayM as_swizzlingInstanceMethod:@selector(getObjects:range:) to:@selector(as_getObjects:range:)];
    });
}

#pragma mark - class cluster

+ (Class)clsNSArrayM
{
    return objc_getClass("__NSArrayM");
}

#pragma mark - objectAtIndex:

- (id)as_objectAtIndex:(NSUInteger)index
{
    id object = nil;
    
    @try
    {
        object = [self as_objectAtIndex:index];
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


#pragma mark - addObject:

- (void)as_addObject:(id)anObject
{
    @try
    {
        [self as_addObject:anObject];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - insertObject:atIndex:

- (void)as_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    @try
    {
        [self as_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - removeObjectAtIndex:

- (void)as_removeObjectAtIndex:(NSUInteger)index
{
    @try
    {
        [self as_removeObjectAtIndex:index];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - removeObjectsAtIndexes:

- (void)as_removeObjectsAtIndexes:(NSIndexSet *)indexes
{
    @try
    {
        [self as_removeObjectsAtIndexes:indexes];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - removeObjectsInRange:

- (void)as_removeObjectsInRange:(NSRange)range
{
    @try
    {
        [self as_removeObjectsInRange:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - replaceObjectAtIndex:withObject:

- (void)as_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    @try
    {
        [self as_replaceObjectAtIndex:index withObject:anObject];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
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

#pragma mark - get object from array

- (void)as_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    @try
    {
        [self as_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - getObjects:range:

- (void)as_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range
{
    @try
    {
        [self as_getObjects:objects range:range];
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
