//
//  ArraySummer.m
//  ArraySums
//
//  Created by Steve Baker on 1/19/16.
//  Copyright © 2016 Beepscore LLC. All rights reserved.
//

#import "ArraySummer.h"

@implementation ArraySummer

+ (BOOL)hasEqualSums:(NSArray *)array {

    if (!array
        || [array isEqualToArray:@[]]
        || (array.count == 1)) {
        return NO;
    }

    NSInteger const INDEX_MIDDLE = [ArraySummer middleIndexOfArray:array];

    // may be a little faster to calculate both sums in one loop
    // could profile to check
    NSInteger sumHead = [ArraySummer sumHead:array endIndexExclusive:INDEX_MIDDLE];
    NSInteger sumTail = [ArraySummer sumTail:array startIndexInclusive:INDEX_MIDDLE];

    NSInteger sumHeadAtIndexDecrementing = sumHead;
    NSInteger sumTailAtIndexDecrementing = sumTail;

    NSInteger sumHeadAtIndexIncrementing = 0;
    NSInteger sumTailAtIndexIncrementing = 0;

    if (INDEX_MIDDLE < array.count - 1) {
        sumHeadAtIndexIncrementing = sumHead + [array[INDEX_MIDDLE] integerValue];
        sumTailAtIndexIncrementing = sumTail - [array[INDEX_MIDDLE] integerValue];
    }

    NSInteger indexDecrementing = INDEX_MIDDLE;
    for (NSInteger indexIncrementing = (INDEX_MIDDLE + 1); indexIncrementing < array.count; indexIncrementing++) {

        if (sumHeadAtIndexDecrementing == sumTailAtIndexDecrementing) {
            return YES;
        }

        if (sumHeadAtIndexIncrementing == sumTailAtIndexIncrementing) {
            return YES;
        }

        indexDecrementing -= 1;

        if (indexDecrementing >= 0) {
            sumHeadAtIndexDecrementing -= [array[indexDecrementing] integerValue];
            sumTailAtIndexDecrementing += [array[indexDecrementing] integerValue];
        }

        if (indexIncrementing < array.count) {
            sumHeadAtIndexIncrementing += [array[indexIncrementing] integerValue];
            sumTailAtIndexIncrementing -= [array[indexIncrementing] integerValue];
        }
    }
    return NO;
}

+ (NSInteger)sumHead:(NSArray *)array endIndexExclusive:(NSInteger)endIndexExclusive {

    if (!array
        || [array isEqualToArray:@[]]) {
        return 0;
    }
    if (endIndexExclusive > array.count) {
        endIndexExclusive = array.count;
    }

    NSInteger sumHead = 0;
    for (NSInteger index = 0; index < endIndexExclusive; index++) {
        sumHead += [array[index] integerValue];
    }
    return sumHead;
}

+ (NSInteger)sumTail:(NSArray *)array startIndexInclusive:(NSInteger)startIndexInclusive {

    if (!array
        || [array isEqualToArray:@[]]) {
        return 0;
    }
    if (startIndexInclusive >= array.count) {
        return 0;
    }

    NSInteger sumTail = 0;
    for (NSInteger index = startIndexInclusive; index < array.count; index++) {
        sumTail += [array[index] integerValue];
    }
    return sumTail;
}

/**
 * @return next lowest index if array.count is even
 */
+ (NSInteger)middleIndexOfArray:(NSArray *)array {
    if (!array
        || [array isEqualToArray:@[]]) {
        return -1;
    }
    // integer division truncates
    return (array.count - 1) / 2;
}

@end
