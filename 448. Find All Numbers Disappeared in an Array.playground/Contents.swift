/**
 448. Find All Numbers Disappeared in an Array
 Easy
 https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/

 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

 Example 1:
 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 
 Example 2:
 Input: nums = [1,1]
 Output: [2]

 Constraints:
 n == nums.length
 1 <= n <= 105
 1 <= nums[i] <= n

 Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 */

import XCTest

class Solution {
    // time complexity `O(n)` where `n` is the length of `nums`
    // space complexity `O(n)` where `n` is the length of `nums`
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        Array(Set(1...nums.count).subtracting(nums))
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_findDisappearedNumbers_ReturnsExpectedResultWhenArrayConsistsOfDifferentNumbers() {
        // given
        let nums = [4,3,2,7,8,2,3,1]
        let expectedResult = [5,6]
        
        // when
        let actualResult = solution.findDisappearedNumbers(nums)
        
        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func test_findDisappearedNumbers_ReturnsExpectedResultWhenArrayConsistsOfEqualNumbers() {
        // given
        let nums = [1,1]
        let expectedResult = [2]
        
        // when
        let actualResult = solution.findDisappearedNumbers(nums)
        
        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
}

SolutionTests.defaultTestSuite.run()
