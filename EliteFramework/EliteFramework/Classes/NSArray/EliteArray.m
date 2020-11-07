//
//  EliteArray.m
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/20.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

#import "EliteArray.h"

@implementation NSArray (EliteArrayCategory)

- (NSArray *)sortedArrayUsingKey:(NSString *)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    
    NSArray *array = [NSArray arrayWithObject:sortDescriptor];
    
    return [self sortedArrayUsingDescriptors:array];
}

@end


@implementation NSMutableArray (EliteMutableArrayCategory)

- (NSMutableArray *)sortedArrayUsingKey:(NSString *)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    
    NSArray *array = [NSArray arrayWithObject:sortDescriptor];
    
    return [[NSMutableArray alloc] initWithArray:[self sortedArrayUsingDescriptors:array]];
}

@end
