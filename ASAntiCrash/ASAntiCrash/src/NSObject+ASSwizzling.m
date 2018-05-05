//
//  NSObject+ASSwizzling.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSObject+ASSwizzling.h"

#import <objc/runtime.h>

@implementation NSObject (ASSwizzling)

+ (void)as_swizzlingInstanceMethod:(SEL)sourceSEL to:(SEL)newSEL
{
    Class cls = self.class;
    
    Method sourceMethod = class_getInstanceMethod(cls, sourceSEL);
    Method newMethod = class_getInstanceMethod(cls, newSEL);
    
    [cls as_swizzlingMethod:sourceMethod to:newMethod];
}

+ (void)as_swizzlingClassMethod:(SEL)sourceSEL to:(SEL)newSEL
{
    Class cls = self.class;
    
    Method sourceMethod = class_getClassMethod(cls, sourceSEL);
    Method newMethod = class_getClassMethod(cls, newSEL);
    
    Class metaCls = objc_getMetaClass(NSStringFromClass(self.class).UTF8String);
    
    [metaCls as_swizzlingMethod:sourceMethod to:newMethod];
}

+ (void)as_swizzlingMethod:(Method)sourceMethod to:(Method)newMethod
{
    BOOL canAddMethod = class_addMethod(self,
                                        method_getName(sourceMethod),
                                        method_getImplementation(newMethod),
                                        method_getTypeEncoding(newMethod));
    
    if (canAddMethod)
    {
        class_replaceMethod(self,
                            method_getName(newMethod),
                            method_getImplementation(sourceMethod),
                            method_getTypeEncoding(sourceMethod));
    }
    else
    {
        method_exchangeImplementations(sourceMethod, newMethod);
    }
}

@end
