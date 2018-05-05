//
//  NSException+ASLog.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "NSException+ASLog.h"

@implementation NSException (ASLog)

- (void)as_logException
{
    NSLog(@"\n[ASException]\nname : %@\nreason : %@", self.name, self.reason);
}

@end
