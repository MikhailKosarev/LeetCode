/*
 217. Contains Duplicate
 Easy

 https://leetcode.com/problems/contains-duplicate/description/

 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

 Example 1:
 Input: nums = [1,2,3,1]
 Output: true
 
 Example 2:
 Input: nums = [1,2,3,4]
 Output: false
 
 Example 3:
 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true

 Constraints:
 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 */
import XCTest

class Solution {
    // straight solution
    // time complexity `O(n)`, where `n` is the number of elements in the given array.
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var elements = Set<Int>()

        for num in nums {
            if elements.contains(num) {
                return true
            }
            elements.insert(num)
        }

        return false
    }
    
    // elegant short solution
    // time complexity `O(n)`, where `n` is the number of elements in the given array.
    func containsDuplicateShort(_ nums: [Int]) -> Bool {
        nums.count != Set(nums).count
    }
}

class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testContainsDuplicateReturnsTrueWhenThereIsDuplicateInTheGivenArray() {
        // given
        let nums = [1,2,3,1]
        
        // when
        let result = solution.containsDuplicate(nums)
        
        // then
        XCTAssertTrue(result)
    }
    
    func testContainsDuplicateReturnsFalseWhenThereAreNoDuplicatesInTheGivenArray() {
        // given
        let nums = [1,2,3,4]
        
        // when
        let result = solution.containsDuplicate(nums)
        
        // then
        XCTAssertFalse(result)
    }
    
    func testContainsDuplicateReturnsTrueWhenThereAreManyDuplicatesInTheGivenArray() {
        // given
        let nums = [1,1,1,3,3,4,3,2,4,2]
        
        // when
        let result = solution.containsDuplicate(nums)
        
        // then
        XCTAssertTrue(result)
    }
    
    func testContainsDuplicateShortReturnsTrueWhenThereIsDuplicateInTheGivenArray() {
        // given
        let nums = [1,2,3,1]
        
        // when
        let result = solution.containsDuplicate(nums)
        
        // then
        XCTAssertTrue(result)
    }
    
    func testContainsDuplicateShortReturnsFalseWhenThereAreNoDuplicatesInTheGivenArray() {
        // given
        let nums = [1,2,3,4]
        
        // when
        let result = solution.containsDuplicate(nums)
        
        // then
        XCTAssertFalse(result)
    }
    
    func testContainsDuplicateShortReturnsTrueWhenThereAreManyDuplicatesInTheGivenArray() {
        // given
        let nums = [1,1,1,3,3,4,3,2,4,2]
        
        // when
        let result = solution.containsDuplicate(nums)
        
        // then
        XCTAssertTrue(result)
    }
}

SolutionTests.defaultTestSuite.run()
