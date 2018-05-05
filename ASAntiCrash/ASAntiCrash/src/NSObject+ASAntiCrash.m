//
//  NSObject+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSObject+ASAntiCrash.h"

#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSObject (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^
    {
        [NSObject as_swizzlingInstanceMethod:@selector(forwardingTargetForSelector:) to:@selector(as_forwardingTargetForSelector:)];
        
        [NSObject as_swizzlingClassMethod:@selector(forwardingTargetForSelector:) to:@selector(as_classForwardingTargetForSelector:)];
        
        [NSObject as_swizzlingInstanceMethod:@selector(setValue:forKey:) to:@selector(as_setValue:forKey:)];
        
        [NSObject as_swizzlingInstanceMethod:@selector(setValue:forKeyPath:) to:@selector(as_setValue:forKeyPath:)];
        
        [NSObject as_swizzlingInstanceMethod:@selector(setValue:forUndefinedKey:) to:@selector(as_setValue:forUndefinedKey:)];
        
        [NSObject as_swizzlingInstanceMethod:@selector(setValuesForKeysWithDictionary:) to:@selector(as_setValuesForKeysWithDictionary:)];
        
        [NSObject as_swizzlingInstanceMethod:@selector(addObserver:forKeyPath:options:context:) to:@selector(as_addObserver:forKeyPath:options:context:)];
        
        [NSObject as_swizzlingInstanceMethod:@selector(removeObserver:forKeyPath:) to:@selector(as_removeObserver:forKeyPath:)];
    });
}

#pragma mark - forwardingTargetForSelector:

- (id)as_forwardingTargetForSelector:(SEL)aSelector
{
    id object = [self as_signatureMethodType:NO forwardingTargetForSelector:aSelector];
    
    if (object)
    {
        return object;
    }
    
    return [self as_forwardingTargetForSelector:aSelector];
}

- (id)as_classForwardingTargetForSelector:(SEL)aSelector
{
    id object = [self as_signatureMethodType:YES forwardingTargetForSelector:aSelector];
    
    if (object)
    {
        return object;
    }
    
    return [self as_classForwardingTargetForSelector:aSelector];
}

// 返回正确的签名函数，没有就创建
- (id)as_signatureMethodType:(BOOL)isClassMethod
 forwardingTargetForSelector:(SEL)aSelector
{
    if ([self isKindOfClass:NSNumber.class] && [NSString instancesRespondToSelector:aSelector])
    {
        NSString *string = [(NSNumber *)self stringValue];
        
        return string;
    }
    else if ([self isKindOfClass:NSString.class] && [NSNumber instancesRespondToSelector:aSelector])
    {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *number = [formatter numberFromString:(NSString *)self];
        
        return number;
    }
    
    BOOL isRespond = [self respondsToSelector:aSelector];
    
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    
    if (!isRespond && !signature)
    {
        [self addMethod:aSelector methodType:isClassMethod];
        
        if (isClassMethod)
        {
            [self throwUnrecognizedClassSelectorException:aSelector];
            
            return object_getClass(self.class);
        }
        else
        {
            [self throwUnrecognizedInstanceSelectorException:aSelector];
            
            return self.class;
        }
    }
    
    return nil;
}

- (void)addMethod:(SEL)aSelector methodType:(BOOL)isClassMethod
{
    BOOL isRespond = [self respondsToSelector:aSelector];
    
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    
    if (isRespond || signature)
    {
        return;
    }
    
    NSString *selName = NSStringFromSelector(aSelector);
    
    NSMutableString *tmpString = [[NSMutableString alloc] initWithFormat:@"%@", selName];
    
    int count = (int)[tmpString replaceOccurrencesOfString:@":"
                                                withString:@"_"
                                                   options:NSCaseInsensitiveSearch
                                                     range:NSMakeRange(0, selName.length)];
    
    NSMutableString *val = [[NSMutableString alloc] initWithString:@"i@:"];
    
    for (int i = 0; i < count; i++)
    {
        [val appendString:@"@"];
    }
    
    class_addMethod(isClassMethod ? object_getClass(self.class) : self.class,
                    aSelector,
                    (IMP)replaceFunction,
                    val.UTF8String);
}

void replaceFunction(id target, SEL cmd, ...)
{
    
}

- (void)throwUnrecognizedInstanceSelectorException:(SEL)aSelector
{
    NSString *reason = [NSString stringWithFormat:@"-[%@ %@]: unrecognized selector sent to instance %p", NSStringFromClass(self.class), NSStringFromSelector(aSelector), self];
    
    NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                     reason:reason
                                                   userInfo:nil];
    
    [exception as_logException];
}

- (void)throwUnrecognizedClassSelectorException:(SEL)aSelector
{
    NSString *reason = [NSString stringWithFormat:@"+[%@ %@]: unrecognized selector sent to class %p'", NSStringFromClass(self.class), NSStringFromSelector(aSelector), self.class];
    
    NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                     reason:reason
                                                   userInfo:nil];
    
    [exception as_logException];
}

#pragma mark - setValue:forKey:

- (void)as_setValue:(id)value forKey:(NSString *)key
{
    @try
    {
        [self as_setValue:value forKey:key];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - setValue:forKeyPath:

- (void)as_setValue:(id)value forKeyPath:(NSString *)keyPath
{
    @try
    {
        [self as_setValue:value forKeyPath:keyPath];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - setValue:forUndefinedKey:

- (void)as_setValue:(id)value forUndefinedKey:(NSString *)key
{
    @try
    {
        [self as_setValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - setValuesForKeysWithDictionary:

- (void)as_setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    @try
    {
        [self as_setValuesForKeysWithDictionary:keyedValues];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - addObserver:forKeyPath:options:context:

- (void)as_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    if (!observer || !keyPath.length)
    {
        return;
    }
    
    @try
    {
        [self as_addObserver:observer forKeyPath:keyPath options:options context:context];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
}

#pragma mark - removeObserver:forKeyPath:

- (void)as_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if (!observer || !keyPath.length)
    {
        return;
    }
    
    @try
    {
        [self as_removeObserver:observer forKeyPath:keyPath];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
}

@end
