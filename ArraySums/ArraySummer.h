//
//  ArraySummer.h
//  ArraySums
//
//  Created by Steve Baker on 1/19/16.
//  Copyright © 2016 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArraySummer : NSObject

+ (BOOL)hasEqualSums:(NSArray *)array;

/**
 * @return sum of array element values from 0..indexInclusive
 * return 0 if array is nil or empty
 * return sum of entire array if indexInclusive is >= array.count
 */
+ (NSInteger)sumHead:(NSArray *)array index:(NSInteger)indexInclusive;

/**
 * @return sum of array element values from (indexExclusive + 1) to (array.count - 1)
 * return 0 if array is nil or empty
 * return 0 if indexExclusive is >= (array.count - 1)
 */
+ (NSInteger)sumTail:(NSArray *)array index:(NSInteger)indexExclusive;

@end
