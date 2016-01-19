//
//  ArraySummerTests.m
//  ArraySumsTests
//
//  Created by Steve Baker on 1/19/16.
//  Copyright © 2016 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ArraySummer.h"

@interface ArraySummerTests : XCTestCase

@end

@implementation ArraySummerTests

#pragma mark - testMiddleIndexOfArray

- (void)testMiddleIndexOfArrayNil {
    XCTAssertEqual(-1, [ArraySummer middleIndexOfArray:nil]);
}

- (void)testMiddleIndexOfArrayEmpty {
    XCTAssertEqual(-1, [ArraySummer middleIndexOfArray:@[]]);
}

- (void)testMiddleIndexOfArrayCountOne {
    XCTAssertEqual(0, [ArraySummer middleIndexOfArray:@[@8]]);
}

- (void)testMiddleIndexOfArrayCountTwo {
    NSArray *array = @[@4, @9];
    XCTAssertEqual(0, [ArraySummer middleIndexOfArray:array]);
}

- (void)testMiddleIndexOfArrayCountThree {
    NSArray *array = @[@4, @9, @7];
    XCTAssertEqual(1, [ArraySummer middleIndexOfArray:array]);
}

#pragma mark - testSumHeadEndIndexExclusive

- (void)testSumHeadEndIndexExclusiveNil {
    XCTAssertEqual(0, [ArraySummer sumHead:nil endIndexExclusive:5]);
}

- (void)testSumHeadEndIndexExclusiveEmpty {
    XCTAssertEqual(0, [ArraySummer sumHead:@[] endIndexExclusive:5]);
}

- (void)testSumHeadEndIndexExclusiveArrayCountOne {
    XCTAssertEqual(0, [ArraySummer sumHead:@[@4] endIndexExclusive:0]);
    XCTAssertEqual(4, [ArraySummer sumHead:@[@4] endIndexExclusive:1]);
    XCTAssertEqual(4, [ArraySummer sumHead:@[@4] endIndexExclusive:6]);
}

- (void)testSumHeadEndIndexExclusiveArrayCountTwo {
    NSArray *array = @[@4, @9];
    XCTAssertEqual(0, [ArraySummer sumHead:array endIndexExclusive:0]);
    XCTAssertEqual(4, [ArraySummer sumHead:array endIndexExclusive:1]);
    XCTAssertEqual(13, [ArraySummer sumHead:array endIndexExclusive:6]);
}

#pragma mark - testSumTailStartIndexInclusive

- (void)testSumTailStartIndexInclusiveNil {
    XCTAssertEqual(0, [ArraySummer sumTail:nil startIndexInclusive:5]);
}

- (void)testSumTailStartIndexInclusiveEmpty {
    XCTAssertEqual(0, [ArraySummer sumTail:@[] startIndexInclusive:5]);
}

- (void)testSumTailStartIndexInclusiveArrayCountOne {
    XCTAssertEqual(4, [ArraySummer sumTail:@[@4] startIndexInclusive:0]);
    XCTAssertEqual(0, [ArraySummer sumTail:@[@4] startIndexInclusive:1]);
    XCTAssertEqual(0, [ArraySummer sumTail:@[@4] startIndexInclusive:6]);
}

- (void)testSumTailStartIndexInclusiveArrayCountTwo {
    NSArray *array = @[@4, @9];
    XCTAssertEqual(13, [ArraySummer sumTail:array startIndexInclusive:0]);
    XCTAssertEqual(9, [ArraySummer sumTail:array startIndexInclusive:1]);
    XCTAssertEqual(0, [ArraySummer sumTail:array startIndexInclusive:6]);
}

#pragma mark -testHasEqualSums

- (void)testHasEqualSumsNil {
    XCTAssertFalse([ArraySummer hasEqualSums:nil]);
}

- (void)testHasEqualSumsEmpty {
    XCTAssertFalse([ArraySummer hasEqualSums:@[]]);
}

- (void)testHasEqualSumsCountOne {
    XCTAssertFalse([ArraySummer hasEqualSums:@[@0]]);
    XCTAssertFalse([ArraySummer hasEqualSums:@[@4]]);
}

- (void)testHasEqualSumsCountTwo {
    NSArray *array = @[@4, @9];
    XCTAssertFalse([ArraySummer hasEqualSums:array]);
    array = @[@0, @0];
    XCTAssertTrue([ArraySummer hasEqualSums:array]);
    array = @[@4, @4];
    XCTAssertTrue([ArraySummer hasEqualSums:array]);
}

- (void)testHasEqualSumsCountThree {
    NSArray *array = @[@4, @9, @4];
    XCTAssertFalse([ArraySummer hasEqualSums:array]);
    array = @[@4, @2, @2];
    XCTAssertTrue([ArraySummer hasEqualSums:array]);
}

- (void)testHasEqualSumsCountFour {
    NSArray *array = @[@3, @3, @4, @9];
    XCTAssertFalse([ArraySummer hasEqualSums:array]);
    array = @[@4, @9, @4, @9];
    XCTAssertTrue([ArraySummer hasEqualSums:array]);
}

@end
