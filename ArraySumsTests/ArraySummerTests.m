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

#pragma mark - testSumHeadIndex

- (void)testSumHeadIndexNil {
    XCTAssertEqual(0, [ArraySummer sumHead:nil index:5]);
}

- (void)testSumHeadIndexEmpty {
    XCTAssertEqual(0, [ArraySummer sumHead:@[] index:5]);
}

- (void)testSumHeadIndexArrayCountOne {
    XCTAssertEqual(4, [ArraySummer sumHead:@[@4] index:0]);
    XCTAssertEqual(4, [ArraySummer sumHead:@[@4] index:1]);
    XCTAssertEqual(4, [ArraySummer sumHead:@[@4] index:6]);
}

- (void)testSumHeadIndexArrayCountTwo {
    NSArray *array = @[@4, @9];
    XCTAssertEqual(4, [ArraySummer sumHead:array index:0]);
    XCTAssertEqual(13, [ArraySummer sumHead:array index:1]);
    XCTAssertEqual(13, [ArraySummer sumHead:array index:6]);
}

#pragma mark - testSumTailIndex

- (void)testSumTailIndexNil {
    XCTAssertEqual(0, [ArraySummer sumTail:nil index:5]);
}

- (void)testSumTailIndexEmpty {
    XCTAssertEqual(0, [ArraySummer sumTail:@[] index:5]);
}

- (void)testSumTailIndexArrayCountOne {
    XCTAssertEqual(0, [ArraySummer sumTail:@[@4] index:0]);
    XCTAssertEqual(0, [ArraySummer sumTail:@[@4] index:1]);
    XCTAssertEqual(0, [ArraySummer sumTail:@[@4] index:6]);
}

- (void)testSumTailIndexArrayCountTwo {
    NSArray *array = @[@4, @9];
    XCTAssertEqual(9, [ArraySummer sumTail:array index:0]);
    XCTAssertEqual(0, [ArraySummer sumTail:array index:1]);
    XCTAssertEqual(0, [ArraySummer sumTail:array index:6]);
}

#pragma mark -testHasEqualSums

- (void)testHasEqualSumsNil {
    XCTAssertFalse([ArraySummer hasEqualSums:nil]);
}

- (void)testHasEqualSumsEmpty {
    XCTAssertFalse([ArraySummer hasEqualSums:@[]]);
}

- (void)testHasEqualSumsCountOne {
    XCTAssertFalse([ArraySummer hasEqualSums:@[@4]]);
}

- (void)testHasEqualSumsCountTwo {
    NSArray *array = @[@4, @9];
    XCTAssertFalse([ArraySummer hasEqualSums:array]);
    array = @[@4, @4];
    XCTAssertTrue([ArraySummer hasEqualSums:array]);
}

@end
