//
//  NSString+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSString+ASAntiCrash.h"

#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSString (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [NSString as_swizzlingClassMethod:@selector(stringWithUTF8String:) to:@selector(as_stringWithUTF8String:)];
        
        [NSString as_swizzlingClassMethod:@selector(stringWithCString:encoding:) to:@selector(as_stringWithCString:encoding:)];
        
        [self.clsNSPlaceholderString as_swizzlingInstanceMethod:@selector(initWithCString:encoding:) to:@selector(as_initWithCString:encoding:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(stringByAppendingString:) to:@selector(as_stringByAppendingString:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(substringFromIndex:) to:@selector(as_substringFromIndex:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(substringToIndex:) to:@selector(as_substringToIndex:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(substringWithRange:) to:@selector(as_substringWithRange:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(rangeOfString:options:range:locale:) to:@selector(as_rangeOfString:options:range:locale:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(stringByReplacingOccurrencesOfString:withString:) to:@selector(as_stringByReplacingOccurrencesOfString:withString:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) to:@selector(as_stringByReplacingOccurrencesOfString:withString:options:range:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(stringByReplacingCharactersInRange:withString:) to:@selector(as_stringByReplacingCharactersInRange:withString:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(characterAtIndex:) to:@selector(as_characterAtIndex:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(hasPrefix:) to:@selector(as_hasPrefix:)];
        
        [self.clsNSCFConstantString as_swizzlingInstanceMethod:@selector(hasSuffix:) to:@selector(as_hasSuffix:)];
    });
}

#pragma mark - class cluster

+ (Class)clsNSCFConstantString
{
    return objc_getClass("__NSCFConstantString");
}

+ (Class)clsNSPlaceholderString
{
    return objc_getClass("NSPlaceholderString");
}

#pragma mark - stringWithUTF8String:

+ (NSString *)as_stringWithUTF8String:(const char *)nullTerminatedCString
{
    NSString *string = @"";
    
    @try
    {
        string = [self as_stringWithUTF8String:nullTerminatedCString];
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

#pragma mark - stringWithCString:encoding:

+ (NSString *)as_stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc
{
    NSString *string = @"";
    
    @try
    {
        string = [self as_stringWithCString:cString encoding:enc];
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

#pragma mark - initWithCString:encoding:

- (NSString *)as_initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
    NSString *string = @"";
    
    if (nullTerminatedCString != NULL)
    {
        string = [self as_initWithCString:nullTerminatedCString encoding:encoding];
    }
    else
    {
        [self throwInitWithCstringEncodingException];
    }
    
    return string;
}

- (void)throwInitWithCstringEncodingException
{
    NSString *reason = @"*** -[NSPlaceholderString as_InitWithCString:encoding:]: nil argument";
    
    NSException *exception = [NSException exceptionWithName:NSInvalidArgumentException
                                                     reason:reason
                                                   userInfo:nil];
    
    [exception as_logException];
}

#pragma mark - stringByAppendingString:

- (NSString *)as_stringByAppendingString:(NSString *)aString
{
    NSString *newStr = nil;
    
    @try
    {
        newStr = [self as_stringByAppendingString:aString];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        newStr = self;
    }
    @finally
    {
        return newStr;
    }
}

#pragma mark - substringFromIndex:

- (NSString *)as_substringFromIndex:(NSUInteger)from
{
    NSString *subString = nil;
    
    @try
    {
        subString = [self as_substringFromIndex:from];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        subString = nil;
    }
    @finally
    {
        return subString;
    }
}

#pragma mark - substringToIndex:

- (NSString *)as_substringToIndex:(NSUInteger)to
{
    NSString *subString = nil;
    
    @try
    {
        subString = [self as_substringToIndex:to];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        subString = nil;
    }
    @finally
    {
        return subString;
    }
}

#pragma mark - substringWithRange:

- (NSString *)as_substringWithRange:(NSRange)range
{
    NSString *subString = nil;
    
    @try
    {
        subString = [self as_substringWithRange:range];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        subString = nil;
    }
    @finally
    {
        return subString;
    }
}

#pragma mark - rangeOfString:options:range:locale:

- (NSRange)as_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(NSLocale *)locale
{
    NSRange newRange = NSMakeRange(NSNotFound, 0);
    
    @try
    {
        newRange = [self as_rangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return newRange;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:

- (NSString *)as_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
{
    NSString *newStr = nil;
    
    @try
    {
        newStr = [self as_stringByReplacingOccurrencesOfString:target withString:replacement];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        newStr = nil;
    }
    @finally
    {
        return newStr;
    }
}

#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)as_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
    NSString *newStr = nil;
    
    @try
    {
        newStr = [self as_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        newStr = nil;
    }
    @finally
    {
        return newStr;
    }
}

#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)as_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
{
    NSString *newStr = nil;
    
    @try
    {
        newStr = [self as_stringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
        
        newStr = nil;
    }
    @finally
    {
        return newStr;
    }
}

#pragma mark - characterAtIndex:

- (unichar)as_characterAtIndex:(NSUInteger)index
{
    unichar characteristic;
    
    @try
    {
        characteristic = [self as_characterAtIndex:index];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return characteristic;
    }
}

#pragma mark - hasPrefix:

- (BOOL)as_hasPrefix:(NSString *)str
{
    BOOL result = NO;
    
    @try
    {
        result = [self as_hasPrefix:str];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return result;
    }
}

#pragma mark - hasSuffix:

- (BOOL)as_hasSuffix:(NSString *)str
{
    BOOL result = NO;
    
    @try
    {
        result = [self as_hasSuffix:str];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return result;
    }
}

@end
