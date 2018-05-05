//
//  NSAttributedString+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSAttributedString+ASAntiCrash.h"

#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSAttributedString (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [self.clsNSConcreteAttributedString as_swizzlingInstanceMethod:@selector(initWithString:) to:@selector(as_initWithString:)];
        
        [self.clsNSConcreteAttributedString as_swizzlingInstanceMethod:@selector(initWithAttributedString:) to:@selector(as_initWithAttributedString:)];
        
        [self.clsNSConcreteAttributedString as_swizzlingInstanceMethod:@selector(initWithString:attributes:) to:@selector(as_initWithString:attributes:)];
        
        [self.clsNSConcreteAttributedString as_swizzlingInstanceMethod:@selector(attributedSubstringFromRange:) to:@selector(as_attributedSubstringFromRange:)];
        
        [self.clsNSConcreteAttributedString as_swizzlingInstanceMethod:@selector(enumerateAttribute:inRange:options:usingBlock:) to:@selector(as_enumerateAttribute:inRange:options:usingBlock:)];
        
        [self.clsNSConcreteAttributedString as_swizzlingInstanceMethod:@selector(enumerateAttributesInRange:options:usingBlock:) to:@selector(as_enumerateAttributesInRange:options:usingBlock:)];
    });
}

#pragma mark - class cluster

+ (Class)clsNSConcreteAttributedString
{
    return objc_getClass("NSConcreteAttributedString");
}

#pragma mark - initWithString:

- (instancetype)as_initWithString:(NSString *)str
{
    id object = nil;
    
    @try
    {
        object = [self as_initWithString:str];
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

#pragma mark - initWithAttributedString

- (instancetype)as_initWithAttributedString:(NSAttributedString *)attrStr
{
    id object = nil;
    
    @try
    {
        object = [self as_initWithAttributedString:attrStr];
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

#pragma mark - initWithString:attributes:

- (instancetype)as_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs
{
    id object = nil;
    
    @try
    {
        object = [self as_initWithString:str attributes:attrs];
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

#pragma mark - attributedSubstringFromRange:

- (NSAttributedString *)as_attributedSubstringFromRange:(NSRange)range
{
    NSAttributedString *string = nil;
    
    @try
    {
        string = [self as_attributedSubstringFromRange:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return string;
    }
}

#pragma mark - enumerateAttribute:inRange:options:usingBlock:

- (void)as_enumerateAttribute:(NSAttributedStringKey)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(id _Nullable value, NSRange range, BOOL *stop))block
{
    @try
    {
        [self as_enumerateAttribute:attrName inRange:enumerationRange options:opts usingBlock:block];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - enumerateAttributesInRange:options:usingBlock:

- (void)as_enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(NSDictionary<NSAttributedStringKey, id> *attrs, NSRange range, BOOL *stop))block
{
    @try
    {
        [self as_enumerateAttributesInRange:enumerationRange options:opts usingBlock:block];
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
