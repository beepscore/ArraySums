# Purpose
Write a method to search an array for an index such that the sum of elements from 0..index equals the sum of elements from index..last
Array may be very long.
Method should be efficient, don't repeat lots of operations unnecessarily.

# Results

# Ideas

## Must visit each element at least once in order to calculate sum
Big O will be at least O(N)

If elements are somewhat random, then the desired index is probably closer to the middle of the array.
So probably can improve performance (if needed) by working from the middle out to the ends.
Need to be careful about index off-by-one errors for arrays with odd or even number of elements.

## Assumptions
Assume sums of element values are within NSInteger valid range.

## Areas for Possible Improvements

### Reduce risk of result becoming too big and causing an overflow

#### Track difference between head and tail, not sum of head and sum of tail
Start in middle of array, at each iteration move a decrementing index and an incrementing index.
Take the difference in values at the indices and add this to the cumulative difference from previous iterations.
When you get to the ends, if the cumulative difference is 0 return true (YES).

Else,
Start a second loop working outwards from middle.
Try decementing index, update first cumulative difference between head and tail. If 0 return true.
Try incrementing index, update second cumulative difference between head and tail. If 0 return true.

#### Use NSDecimalNumber
NSDecimalNumber can hold a larger value than NSInteger and unlike float or double does not have limited precision.

##### If reduced execution time is desirable can try NSDecimalNumber C interface
http://objc.toodarkpark.net/Foundation/Classes/NSDecimalNumber.html

