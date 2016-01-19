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

