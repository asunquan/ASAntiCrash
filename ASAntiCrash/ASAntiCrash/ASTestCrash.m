//
//  ASTestCrash.m
//  ASAntiCrash
//
//  Created by 孙泉 on 2018/5/4.
//  Copyright © 2018年 asunquan. All rights reserved.
//

#import "ASTestCrash.h"

@implementation ASTestCrash

- (void)testAntiCrash
{
    [self testNSObject];
    
    [self testNSArray];
    
    [self testNSMutableArray];
    
    [self testNSDictionary];
    
    [self testNSMutableDictionary];
    
    [self testNSString];
    
    [self testNSMutableString];
    
    [self testNSAttributedString];
    
    [self testNSMutableAttributedString];
    
    [self testNSURL];
    
    [self testNSFileManager];
    
    [self testNSSet];
    
    [self testNSMutableSet];
    
    [self testNSCache];
}

#pragma mark - NSObject

- (void)testNSObject
{
    NSLog(@"\n==========================================================");
    
    [self testUnrecognizedSelector];
    
    [self testKVC];
    
    [self testKVO];
}

- (void)testUnrecognizedSelector
{
    NSLog(@"\n==========================================================");
    
    [self nilInstanceMethod];
    
    [ASTestCrash nilClassMethod:@"aString"];
}

- (void)testKVC
{
    NSLog(@"\n==========================================================");
    
    NSString *key = nil;
    id value = nil;
    
    [self setValue:value forKey:key];
    
    [self setValue:value forKeyPath:key];
    
    [self setValue:value forUndefinedKey:key];
    
    NSDictionary *keyedValues = nil;
    
    [self setValuesForKeysWithDictionary:keyedValues];
}

- (void)testKVO
{
    NSLog(@"\n==========================================================");
    
    NSObject *object = nil;
    
    NSString *keyPath = nil;
    
    [self addObserver:object forKeyPath:keyPath options:nil context:nil];
    
    [self removeObserver:object forKeyPath:keyPath];
}

#pragma mark - NSArray

- (void)testNSArray
{
    NSLog(@"\n==========================================================");
    
    [self testArrayInit];
    
    [self testArrayOverFlow];
}

- (void)testArrayInit
{
    NSLog(@"\n==========================================================");
    
    NSObject *object = nil;
    
    NSArray *array1 = [NSArray arrayWithObject:object];
    
    NSLog(@"%@", array1);
    
    NSArray *array2 = [NSArray arrayWithObjects:nil count:1];
    
    NSLog(@"%@", array2);
}

- (void)testArrayOverFlow
{
    NSLog(@"\n==========================================================");
    
    NSArray *arrayI = @[@"0", @"1"];
    
    NSArray *arraySingleObjectI = @[@"0"];
    
    NSArray *array0 = @[];
    
    NSLog(@"%@", arrayI[3]);
    
    NSLog(@"%@", arraySingleObjectI[3]);
    
    NSLog(@"%@", array0[3]);
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:3];
    
    [arrayI objectsAtIndexes:indexes];
    
    [arraySingleObjectI objectsAtIndexes:indexes];
    
    [array0 objectsAtIndexes:indexes];
    
    [arrayI objectAtIndexedSubscript:3];
    
    [arraySingleObjectI objectAtIndexedSubscript:3];
    
    [array0 objectAtIndexedSubscript:3];
    
    [arrayI arrayByAddingObject:nil];
}

#pragma mark - NSMutableArray

- (void)testNSMutableArray
{
    NSLog(@"\n==========================================================");
    
    [self testMutableArrayOverFlow];
    
    [self testMutableArrayUpdate];
}

- (void)testMutableArrayOverFlow
{
    NSLog(@"\n==========================================================");
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    NSLog(@"%@", arrayM[1]);
    
    [arrayM objectAtIndexedSubscript:1];
}

- (void)testMutableArrayUpdate
{
    NSLog(@"\n==========================================================");
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    NSObject *object = nil;
    
    [arrayM addObject:object];
    
    [arrayM insertObject:object atIndex:1];
    
    [arrayM removeObjectAtIndex:1];
    
    NSIndexSet *indexes = [NSIndexSet indexSetWithIndex:1];
    
    [arrayM removeObjectsAtIndexes:indexes];
    
    NSRange range = NSMakeRange(2, 1);
    
    [arrayM removeObjectsInRange:range];
    
    [arrayM replaceObjectAtIndex:1 withObject:object];
}

#pragma mark - NSDictionary

- (void)testNSDictionary
{
    NSLog(@"\n==========================================================");
    
    [self testDictionaryInit];
    
    [self testDictionaryObjectForKey];
}

- (void)testDictionaryInit
{
    NSLog(@"\n==========================================================");
    
    NSDictionary *dictionary1 = [NSDictionary dictionaryWithObject:nil forKey:nil];
    
    NSLog(@"%@", dictionary1);
    
    NSDictionary *dictionary2 = [NSDictionary dictionaryWithObjects:nil forKeys:nil count:1];
    
    NSLog(@"%@", dictionary2);
}

- (void)testDictionaryObjectForKey
{
    NSLog(@"\n==========================================================");
    
    NSDictionary *dictionary0 = [NSDictionary dictionary];
    
    NSDictionary *dictionaryI = [NSDictionary dictionaryWithObjectsAndKeys:@"0", @"1", @"2", @"3", nil];
    
    NSDictionary *dictionaryArraySingleEntryI = [NSDictionary dictionaryWithObjectsAndKeys:@"0", @"1", nil];
    
    NSString *key = nil;
    
    NSLog(@"%@", [dictionary0 objectForKey:key]);
    
    NSLog(@"%@", [dictionaryI objectForKey:key]);
    
    NSLog(@"%@", [dictionaryArraySingleEntryI objectForKey:key]);
}

#pragma mark - NSMutableDictionary

- (void)testNSMutableDictionary
{
    NSLog(@"\n==========================================================");
    
    [self testMutableDictionaryUpdate];
}

- (void)testMutableDictionaryUpdate
{
    NSLog(@"\n==========================================================");
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSObject *object = nil;
    
    NSString *key = nil;
    
    [dictionary setObject:object forKey:key];
    
    NSLog(@"%@", [dictionary objectForKey:@"key"]);
    
    [dictionary removeObjectForKey:@"key"];
}

#pragma mark - NSString

- (void)testNSString
{
    NSLog(@"\n==========================================================");
    
    [self testStringInit];
    
    [self testStringUpdate];
}

- (void)testStringInit
{
    NSLog(@"\n==========================================================");
    
    NSString *string1 = [NSString stringWithUTF8String:nil];
    
    NSLog(@"%@", string1);
    
    NSString *string2 = [NSString stringWithCString:nil encoding:NSUnicodeStringEncoding];
    
    NSLog(@"%@", string2);
    
    NSString *string3 = [[NSString alloc] initWithCString:NULL encoding:NSUnicodeStringEncoding];
    
    NSLog(@"%@", string3);
}

- (void)testStringUpdate
{
    NSLog(@"\n==========================================================");
    
    NSString *string1 = @"string1";
    NSString *string2 = nil;
    NSString *string3 = nil;
    
    NSRange range = NSMakeRange(10, 20);
    
    NSLog(@"%@", [string1 substringFromIndex:10]);
    
    NSLog(@"%@", [string1 substringToIndex:10]);
    
    NSLog(@"%@", [string1 substringWithRange:range]);
    
    NSLog(@"%@", [string1 stringByAppendingString:string2]);
    
    NSLog(@"%d", [string1 rangeOfString:string2 options:0 range:range locale:nil]);
    
    NSLog(@"%@", [string1 stringByReplacingOccurrencesOfString:string2 withString:string3]);
    
    NSLog(@"%@", [string1 stringByReplacingOccurrencesOfString:string2 withString:string3 options:0 range:range]);
    
    NSLog(@"%@", [string1 stringByReplacingCharactersInRange:range withString:string2]);
    
    NSLog(@"%hu", [string1 characterAtIndex:10]);
    
    NSLog(@"%d", [string1 hasPrefix:string2]);
    
    NSLog(@"%d", [string1 hasSuffix:string3]);
}

#pragma mark - NSMutableString

- (void)testNSMutableString
{
    NSLog(@"\n==========================================================");
    
    [self testMutableStringInit];
    
    [self testMutableStringUpdate];
}

- (void)testMutableStringInit
{
    NSLog(@"\n==========================================================");
    
    NSMutableString *string1 = [[NSMutableString alloc] initWithCString:NULL encoding:NSUnicodeStringEncoding];
    
    NSLog(@"%@", string1);
}

- (void)testMutableStringUpdate
{
    NSLog(@"\n==========================================================");
    
    NSMutableString *string1 = [NSMutableString stringWithString:@"string1"];
    
    NSString *string2 = nil;
    
    NSRange range = NSMakeRange(10, 20);
    
    [string1 appendFormat:nil];
    
    [string1 appendString:string2];
    
    [string1 stringByAppendingString:string2];
    
    NSLog(@"%@", [string1 substringFromIndex:10]);
    
    NSLog(@"%@", [string1 substringToIndex:10]);
    
    NSLog(@"%@", [string1 substringWithRange:range]);
    
    [string1 insertString:string2 atIndex:10];
    
    [string1 deleteCharactersInRange:range];
    
    [string1 replaceCharactersInRange:range withString:string2];
    
    [string1 stringByReplacingCharactersInRange:range withString:string2];
    
    [string1 rangeOfString:string2 options:0 range:range locale:nil];
}

#pragma mark - NSAttributedString

- (void)testNSAttributedString
{
    NSLog(@"\n==========================================================");
    
    [self testAttributedStringInit];
    
    [self testAttributedStringUpdate];
}

- (void)testAttributedStringInit
{
    NSLog(@"\n==========================================================");
    
    NSString *string1 = nil;
    
    NSDictionary *attributes = nil;
    
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:string1];
    
    NSLog(@"%@", string2);
    
    NSAttributedString *string3 = nil;
    
    NSAttributedString *string4 = [[NSAttributedString alloc] initWithAttributedString:string3];
    
    NSLog(@"%@", string4);
    
    NSAttributedString *string5 = [[NSAttributedString alloc] initWithString:string1 attributes:attributes];
    
    NSLog(@"%@", string5);
}

- (void)testAttributedStringUpdate
{
    NSLog(@"\n==========================================================");
    
    NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:@"string1"];
    
    NSRange range = NSMakeRange(10, 20);
    
    NSLog(@"%@", [string1 attributedSubstringFromRange:range]);
}

#pragma mark - NSMutableAttributedString

- (void)testNSMutableAttributedString
{
    NSLog(@"\n==========================================================");
    
    [self testMutableAttributedStringInit];
    
    [self testMutableAttributedStringUpdate];
}

- (void)testMutableAttributedStringInit
{
    NSLog(@"\n==========================================================");
    
    NSString *string1 = nil;
    
    NSDictionary *attributes = nil;
    
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:string1];
    
    NSLog(@"%@", string2);
    
    NSMutableAttributedString *string3 = [[NSMutableAttributedString alloc] initWithString:string1 attributes:attributes];
    
    NSLog(@"%@", string3);
}

- (void)testMutableAttributedStringUpdate
{
    NSLog(@"\n==========================================================");
    
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"string1"];
    
    NSRange range = NSMakeRange(10, 20);
    
    NSString *key = nil;
    
    id value = nil;
    
    NSDictionary *attributes = nil;
    
    NSAttributedString *string2 = nil;
    
    NSLog(@"%@", [string1 attributedSubstringFromRange:range]);
    
    [string1 addAttribute:key value:value range:range];
    
    [string1 addAttributes:attributes range:range];
    
    [string1 setAttributes:attributes range:range];
    
    [string1 removeAttribute:key range:range];
    
    [string1 deleteCharactersInRange:range];
    
    [string1 replaceCharactersInRange:range withString:key];
    
    [string1 replaceCharactersInRange:range withAttributedString:string2];
    
    [string1 enumerateAttribute:key inRange:range options:0 usingBlock:nil];
    
    [string1 enumerateAttributesInRange:range options:0 usingBlock:nil];
}

#pragma mark - NSURL

- (void)testNSURL
{
    NSLog(@"\n==========================================================");
    
    [self testFileURLPath];
}

- (void)testFileURLPath
{
    NSLog(@"\n==========================================================");
    
    [NSURL fileURLWithPath:nil];
    
    [NSURL fileURLWithPath:nil isDirectory:YES];
}

#pragma mark - NSFileManager

- (void)testNSFileManager
{
    NSLog(@"\n==========================================================");
    
    [self testFileManagerDirectory];
}

- (void)testFileManagerDirectory
{
    NSLog(@"\n==========================================================");
    
    [NSFileManager.defaultManager enumeratorAtURL:nil includingPropertiesForKeys:nil options:0 errorHandler:nil];
}

#pragma mark - NSSet

- (void)testNSSet
{
    NSLog(@"\n==========================================================");
    
    [self testSetInit];
}

- (void)testSetInit
{
    NSLog(@"\n==========================================================");
    
    [NSSet setWithObject:nil];
}

#pragma mark - NSMutableSet

- (void)testNSMutableSet
{
    NSLog(@"\n==========================================================");
    
    [self testMutableSetUpdate];
}

- (void)testMutableSetUpdate
{
    NSLog(@"\n==========================================================");
    
    NSMutableSet *set = [NSMutableSet set];
    
    [set addObject:nil];
    
    [set removeObject:nil];
}

#pragma mark - NSCache

- (void)testNSCache
{
    NSLog(@"\n==========================================================");
    
    [self testCacheUpdate];
}

- (void)testCacheUpdate
{
    NSLog(@"\n==========================================================");
    
    NSCache *cache = [[NSCache alloc] init];
    
    [cache setObject:nil forKey:@""];
    
    [cache setObject:nil forKey:@"" cost:100];
}

@end
