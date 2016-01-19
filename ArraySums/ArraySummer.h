//
//  ArraySummer.h
//  ArraySums
//
//  Created by Steve Baker on 1/19/16.
//  Copyright © 2016 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArraySummer : NSObject

/**
 * @return YES if array contains an index such that
 * the sum of element values in the "head", exclusive range from 0..index
 * equals the sum of element values in the "tail", inclusive range from index...last
 * If array hasEqualSums, index is likely to be near the middle of the array.
 * Implementation starts at middle of array and works outward in both directions.
 */
+ (BOOL)hasEqualSums:(NSArray *)array;

/**
 * @return sum of array element values from 0..endIndexExclusive
 * return 0 if array is nil or empty
 * return sum of entire array if endIndexExclusive >= array.count
 */
+ (NSInteger)sumHead:(NSArray *)array endIndexExclusive:(NSInteger)endIndexExclusive;

/**
 * @return sum of array element values from (indexExclusive + 1) to (array.count - 1)
 * return 0 if array is nil or empty
 * return 0 if startIndexInclusive is >= array.count
 */
+ (NSInteger)sumTail:(NSArray *)array startIndexInclusive:(NSInteger)startIndexInclusive;

/**
 * @return next lowest index if array.count is even
 * return -1 if array is nil or empty
 */
+ (NSInteger)middleIndexOfArray:(NSArray *)array;

@end
