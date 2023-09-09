/**
 303. Range Sum Query - Immutable
 Easy
 https://leetcode.com/problems/range-sum-query-immutable/
 
 Given an integer array nums, handle multiple queries of the following type:
 Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
 Implement the NumArray class:
 NumArray(int[] nums) Initializes the object with the integer array nums.
 int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
  
 Example 1:

 Input
 ["NumArray", "sumRange", "sumRange", "sumRange"]
 [[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
 Output
 [null, 1, -1, -3]

 Explanation
 NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
 numArray.sumRange(0, 2); // return (-2) + 0 + 3 = 1
 numArray.sumRange(2, 5); // return 3 + (-5) + 2 + (-1) = -1
 numArray.sumRange(0, 5); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3

 Constraints:
 1 <= nums.length <= 104
 -105 <= nums[i] <= 105
 0 <= left <= right < nums.length
 At most 104 calls will be made to sumRange.
 */

import XCTest

class NumArrayStraight {
    
    let nums: [Int]

    // time complexity `O(1)`
    // space complexity `O(1)`
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    // time complexity `O(n)` where `n` is the length of `nums`
    // space complexity `O(1)`
    func sumRange(_ left: Int, _ right: Int) -> Int {
        nums[left...right].reduce(0, +)
    }
}


class NumArrayEfficient {
    
    let nums: [Int]
    var prefixSum = [0]

    // time complexity `O(n)` where `n` is the length of `nums`
    // space complexity `O(n)` where `n` is the length of `nums`
    init(_ nums: [Int]) {
        self.nums = nums
        fillPrefixSum()
    }
    
    // time complexity `O(1)`
    // space complexity `O(1)`
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return prefixSum[right + 1] - prefixSum[left]
    }
    
    private func fillPrefixSum() {
        var runningSum = 0
        for num in nums {
            runningSum += num
            prefixSum.append(runningSum)
        }
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */

class NumArrayStraightTests: XCTestCase {
    func test_sumRange_ReturnsExpectedResultWhenGivenZeroIndex() {
        // given
        let nums = [-2, 0, 3, -5, 2, -1]
        let numArray = NumArrayStraight(nums)
        let left = 0
        let right = 2
        let expectedSum = 1
        
        // when
        let actualSum = numArray.sumRange(left, right)
        
        // then
        XCTAssertEqual(expectedSum, actualSum)
    }
    
    func test_sumRange_ReturnsExpectedResultWhenGivenTwoIndicesFromTheMiddle() {
        // given
        let nums = [-2, 0, 3, -5, 2, -1]
        let numArray = NumArrayStraight(nums)
        let left = 2
        let right = 5
        let expectedSum = -1
        
        // when
        let actualSum = numArray.sumRange(left, right)
        
        // then
        XCTAssertEqual(expectedSum, actualSum)
    }
    
    func test_sumRange_ReturnsExpectedResultWhenGivenLastIndex() {
        // given
        let nums = [-2, 0, 3, -5, 2, -1]
        let numArray = NumArrayStraight(nums)
        let left = 0
        let right = 5
        let expectedSum = -3
        
        // when
        let actualSum = numArray.sumRange(left, right)
        
        // then
        XCTAssertEqual(expectedSum, actualSum)
    }
}

class NumArrayEfficientTests: XCTestCase {
    func test_sumRange_ReturnsExpectedResultWhenGivenZeroIndex() {
        // given
        let nums = [-2, 0, 3, -5, 2, -1]
        let numArray = NumArrayEfficient(nums)
        let left = 0
        let right = 2
        let expectedSum = 1
        
        // when
        let actualSum = numArray.sumRange(left, right)
        
        // then
        XCTAssertEqual(expectedSum, actualSum)
    }
    
    func test_sumRange_ReturnsExpectedResultWhenGivenTwoIndicesFromTheMiddle() {
        // given
        let nums = [-2, 0, 3, -5, 2, -1]
        let numArray = NumArrayEfficient(nums)
        let left = 2
        let right = 5
        let expectedSum = -1
        
        // when
        let actualSum = numArray.sumRange(left, right)
        
        // then
        XCTAssertEqual(expectedSum, actualSum)
    }
    
    func test_sumRange_ReturnsExpectedResultWhenGivenLastIndex() {
        // given
        let nums = [-2, 0, 3, -5, 2, -1]
        let numArray = NumArrayEfficient(nums)
        let left = 0
        let right = 5
        let expectedSum = -3
        
        // when
        let actualSum = numArray.sumRange(left, right)
        
        // then
        XCTAssertEqual(expectedSum, actualSum)
    }
}

NumArrayStraightTests.defaultTestSuite.run()
NumArrayEfficientTests.defaultTestSuite.run()
