//
//  NSFileManager+ASAntiCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSFileManager+ASAntiCrash.h"

#import "NSException+ASLog.h"
#import "NSObject+ASSwizzling.h"

@implementation NSFileManager (ASAntiCrash)

#pragma mark - load

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        [NSFileManager as_swizzlingInstanceMethod:@selector(enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:) to:@selector(as_enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:)];
    });
}

#pragma mark - fileURLWithPath:

- (NSDirectoryEnumerator<NSURL *> *)as_enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray<NSURLResourceKey> *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(BOOL (^)(NSURL *url, NSError *error))handler
{
    NSDirectoryEnumerator *enumerator = nil;
    
    @try
    {
        enumerator = [self as_enumeratorAtURL:url includingPropertiesForKeys:keys options:mask errorHandler:handler];
    }
    @catch (NSException *exception)
    {
        [exception as_logException];
    }
    @finally
    {
        return enumerator;
    }
}

@end
