//
//  NSMutableAttributedString+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSMutableAttributedString+ASAntiCrash.h"

#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSMutableAttributedString (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(initWithString:) to:@selector(as_initWithString:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(initWithString:attributes:) to:@selector(as_initWithString:attributes:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(attributedSubstringFromRange:) to:@selector(as_attributedSubstringFromRange:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(addAttribute:value:range:) to:@selector(as_addAttribute:value:range:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(addAttributes:range:) to:@selector(as_addAttributes:range:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(setAttributes:range:) to:@selector(as_setAttributes:range:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(removeAttribute:range:) to:@selector(as_removeAttribute:range:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(deleteCharactersInRange:) to:@selector(as_deleteCharactersInRange:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(replaceCharactersInRange:withString:) to:@selector(as_replaceCharactersInRange:withString:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(replaceCharactersInRange:withAttributedString:) to:@selector(as_replaceCharactersInRange:withAttributedString:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(enumerateAttribute:inRange:options:usingBlock:) to:@selector(as_enumerateAttribute:inRange:options:usingBlock:)];
        
        [self.clsNSConcreteMutableAttributedString as_swizzlingInstanceMethod:@selector(enumerateAttributesInRange:options:usingBlock:) to:@selector(as_enumerateAttributesInRange:options:usingBlock:)];
    });
}

#pragma mark - class cluster

+ (Class)clsNSConcreteMutableAttributedString
{
    return objc_getClass("NSConcreteMutableAttributedString");
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

#pragma mark - addAttribute:value:range:

- (void)as_addAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range
{
    @try
    {
        [self as_addAttribute:name value:value range:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - addAttributes:range:

- (void)as_addAttributes:(NSDictionary<NSAttributedStringKey, id> *)attrs range:(NSRange)range
{
    @try
    {
        [self as_addAttributes:attrs range:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - setAttributes:range:

- (void)as_setAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs range:(NSRange)range
{
    @try
    {
        [self as_setAttributes:attrs range:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - removeAttribute:range:

- (void)as_removeAttribute:(NSAttributedStringKey)name range:(NSRange)range
{
    @try
    {
        [self as_removeAttribute:name range:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - deleteCharactersInRange:

- (void)as_deleteCharactersInRange:(NSRange)range
{
    @try
    {
        [self as_deleteCharactersInRange:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - replaceCharactersInRange:withString:

- (void)as_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
{
    @try
    {
        [self as_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - replaceCharactersInRange:withAttributedString:

- (void)as_replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString
{
    @try
    {
        [self as_replaceCharactersInRange:range withAttributedString:attrString];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
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
