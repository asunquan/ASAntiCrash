//
//  NSMutableString+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSMutableString+ASAntiCrash.h"

#import <objc/runtime.h>
#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSMutableString (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [self.clsNSPlaceholderMutableString as_swizzlingInstanceMethod:@selector(initWithCString:encoding:) to:@selector(as_initWithCString:encoding:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(appendFormat:) to:@selector(as_appendFormat:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(appendString:) to:@selector(as_appendString:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(stringByAppendingString:) to:@selector(as_CFStringByAppendingString:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(substringFromIndex:) to:@selector(as_CFSubstringFromIndex:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(substringToIndex:) to:@selector(as_CFSubstringToIndex:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(substringWithRange:) to:@selector(as_CFSubstringWithRange:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(insertString:atIndex:) to:@selector(as_insertString:atIndex:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(deleteCharactersInRange:) to:@selector(as_deleteCharactersInRange:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(replaceCharactersInRange:withString:) to:@selector(as_replaceCharactersInRange:withString:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(stringByReplacingCharactersInRange:withString:) to:@selector(as_CFStringByReplacingCharactersInRange:withString:)];
        
        [self.clsNSCFString as_swizzlingInstanceMethod:@selector(rangeOfString:options:range:locale:) to:@selector(as_CFRangeOfString:options:range:locale:)];
    });
}

#pragma mark - class cluster

+ (Class)clsNSCFString
{
    return objc_getClass("__NSCFString");
}

+ (Class)clsNSPlaceholderMutableString
{
    return objc_getClass("NSPlaceholderMutableString");
}

#pragma mark - initWithCString:encoding:

- (NSString *)as_initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
    NSString *string = @"";
    
    @try
    {
        string = [self as_initWithCString:nullTerminatedCString encoding:encoding];
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

#pragma mark - appendFormat:

- (void)as_appendFormat:(NSString *)format, ...
{
    @try
    {
        va_list arguments;
        va_start(arguments, format);
        NSString *formatString = [[NSString alloc] initWithFormat:format arguments:arguments];
        
        [self as_appendFormat:@"%@", formatString];
        
        va_end(arguments);
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - appendString:

- (void)as_appendString:(NSString *)aString
{
    @try
    {
        [self as_appendString:aString];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        
    }
}

#pragma mark - stringByAppendingString:

- (NSString *)as_CFStringByAppendingString:(NSString *)aString
{
    NSString *newStr = nil;
    
    @try
    {
        newStr = [self as_CFStringByAppendingString:aString];
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

- (NSString *)as_CFSubstringFromIndex:(NSUInteger)from
{
    NSString *subString = nil;
    
    @try
    {
        subString = [self as_CFSubstringFromIndex:from];
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

- (NSString *)as_CFSubstringToIndex:(NSUInteger)to
{
    NSString *subString = nil;
    
    @try
    {
        subString = [self as_CFSubstringToIndex:to];
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

- (NSString *)as_CFSubstringWithRange:(NSRange)range
{
    NSString *subString = nil;
    
    @try
    {
        subString = [self as_CFSubstringWithRange:range];
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

#pragma mark - insertString:atIndex:

- (void)as_insertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    @try
    {
        [self as_insertString:aString atIndex:loc];
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

#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)as_CFStringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
{
    NSString *newStr = nil;
    
    @try
    {
        newStr = [self as_CFStringByReplacingCharactersInRange:range withString:replacement];
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

#pragma mark - rangeOfString:options:range:locale:

- (NSRange)as_CFRangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(NSLocale *)locale
{
    NSRange newRange = NSMakeRange(NSNotFound, 0);
    
    @try
    {
        newRange = [self as_CFRangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
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

@end
