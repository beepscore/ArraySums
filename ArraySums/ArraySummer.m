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

    // integer division truncates, tail may have one more element than head
    NSInteger const INDEX_MIDDLE = array.count / 2;

    // may be a little faster to calculate both sums in one loop
    // could profile to check
    NSInteger sumHead = [ArraySummer sumHead:array index:INDEX_MIDDLE];
    NSInteger sumTail = [ArraySummer sumTail:array index:INDEX_MIDDLE];

    NSInteger sumHeadAtIndexDecrementing = sumHead;
    NSInteger sumTailAtIndexDecrementing = sumTail;

    NSInteger sumHeadAtIndexIncrementing = 0;
    NSInteger sumTailAtIndexIncrementing = 0;
    if ((INDEX_MIDDLE + 1) < array.count) {
        sumHeadAtIndexIncrementing = sumHead + [array[INDEX_MIDDLE + 1] integerValue];
        sumTailAtIndexIncrementing = sumTail - [array[INDEX_MIDDLE + 1] integerValue];
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

+ (NSInteger)sumHead:(NSArray *)array index:(NSInteger)indexInclusive {

    if (!array
        || [array isEqualToArray:@[]]) {
        return 0;
    }
    if (indexInclusive >= array.count) {
        indexInclusive = array.count - 1;
    }

    NSInteger sumHead = 0;
    for (NSInteger index = 0; index <= indexInclusive; index++) {
        sumHead += [array[index] integerValue];
    }
    return sumHead;
}

+ (NSInteger)sumTail:(NSArray *)array index:(NSInteger)indexExclusive {

    if (!array
        || [array isEqualToArray:@[]]) {
        return 0;
    }
    if (indexExclusive >= array.count) {
        indexExclusive = array.count - 1;
    }

    NSInteger sumTail = 0;
    for (NSInteger index = (indexExclusive + 1); index < array.count; index++) {
        sumTail += [array[index] integerValue];
    }
    return sumTail;
}

@end
