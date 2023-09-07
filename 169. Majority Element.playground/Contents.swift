/**
 169. Majority Element
 Easy
 https://leetcode.com/problems/majority-element/
 
 Given an array nums of size n, return the majority element.
 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

 Example 1:
 Input: nums = [3,2,3]
 Output: 3
 
 Example 2:
 Input: nums = [2,2,1,1,1,2,2]
 Output: 2

 Constraints:
 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109

 Follow-up: Could you solve the problem in linear time and in O(1) space?
 */

import XCTest

class Solution {
    // time complexity `O(n)` where `n` is the length of `nums`
    // space complexity `O(n)` where `n` is the length of `nums`
    func majorityElementLinearSpace(_ nums: [Int]) -> Int {
        var hashTable = [Int: Int]()
        
        nums.forEach { hashTable[$0, default: 0] += 1 }
        
        let maxValue = hashTable.values.max()
        
        for(key, value) in hashTable where value == maxValue {
            return key
        }
        
        return 0
    }
    
    // time complexity `O(n)` where `n` is the length of `nums`
    // space complexity `O(1)`
    func majorityElementConstantSpace(_ nums: [Int]) -> Int {
        var count = 0
        var result = 0
        
        for num in nums {
            if count == 0 {
                result = num
            }
            result == num ? (count += 1) : (count -= 1)
        }
        
        return result
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_majorityElementLinearSpace_ReturnsExpectedValueWhenGivenArrayWithAFewElements() {
        // given
        let nums = [3,2,3]
        let expectedValue = 3
        
        // when
        let actualValue = solution.majorityElementLinearSpace(nums)
        
        // then
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func test_majorityElementLinearSpace_ReturnsExpectedValueWhenGivenArrayWithManyElements() {
        // given
        let nums = [2,2,1,1,1,2,2]
        let expectedValue = 2
        
        // when
        let actualValue = solution.majorityElementLinearSpace(nums)
        
        // then
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func test_majorityElementConstantSpace_ReturnsExpectedValueWhenGivenArrayWithAFewElements() {
        // given
        let nums = [3,2,3]
        let expectedValue = 3
        
        // when
        let actualValue = solution.majorityElementConstantSpace(nums)
        
        // then
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func test_majorityElementConstantSpace_ReturnsExpectedValueWhenGivenArrayWithManyElements() {
        // given
        let nums = [2,2,1,1,1,2,2]
        let expectedValue = 2
        
        // when
        let actualValue = solution.majorityElementConstantSpace(nums)
        
        // then
        XCTAssertEqual(actualValue, expectedValue)
    }
}

SolutionTests.defaultTestSuite.run()
