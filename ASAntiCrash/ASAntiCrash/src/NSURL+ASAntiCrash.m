//
//  NSURL+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSURL+ASAntiCrash.h"

#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSURL (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [NSURL as_swizzlingClassMethod:@selector(fileURLWithPath:) to:@selector(as_fileURLWithPath:)];
        
        [NSURL as_swizzlingClassMethod:@selector(fileURLWithPath:isDirectory:) to:@selector(as_fileURLWithPath:isDirectory:)];
    });
}

#pragma mark - fileURLWithPath:

+ (NSURL *)as_fileURLWithPath:(NSString *)path
{
    NSURL *url = nil;
    
    @try
    {
        url = [self as_fileURLWithPath:path];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return url;
    }
}

#pragma mark - fileURLWithPath:isDirectory:

+ (NSURL *)as_fileURLWithPath:(NSString *)path isDirectory:(BOOL)isDir
{
    NSURL *url = nil;
    
    @try
    {
        url = [self as_fileURLWithPath:path isDirectory:isDir];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return url;
    }
}

@end
