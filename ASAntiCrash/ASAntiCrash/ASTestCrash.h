//
//  ASTestCrash.h
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASTestCrash : NSObject

- (void)testAntiCrash;

- (void)nilInstanceMethod;

+ (void)nilClassMethod:(NSString *)aString;

@end
