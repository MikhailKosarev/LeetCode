/**
 1. Two Sum
 Easy
 https://leetcode.com/problems/two-sum/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.

 Example 1:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 Example 2:
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 Example 3:
 Input: nums = [3,3], target = 6
 Output: [0,1]
  
 Constraints:
 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.

 Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
 */

import XCTest

/*
thoughts:
[2,7,11,15], target = 9
1. Subtract the number from the target and search for the result in the hashTable. If it's there than return current index and index from hashTable.
2. Otherwise add the current number with index to the hashTable and go on.
*/

// time complexity `O(n)` where `n` is then number of elements in the nums.
// space complexity = `O(n)` where `n` is then number of elements in the nums.
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashTable = [Int: Int]()
        
        for (index, number) in nums.enumerated() {
            let subtraction = target - number
            
            if let secondIndex = hashTable[subtraction] {
                return [index, secondIndex]
            } else {
                hashTable[number] = index
            }
        }
        
        return [-1]
    }
}


class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testTwoSumReturnsTwoIndicesWhenGivenArrayOfFourElements() {
        // given
        let nums = [2, 7, 11, 15], target = 9
        let expectedResult1 = [0, 1]
        let expectedResult2 = [1, 0]
        
        // when
        let actualResult = solution.twoSum(nums, target)
        
        // then
        XCTAssert(actualResult == expectedResult1 || actualResult == expectedResult2)
    }
    
    func testTwoSumReturnsTwoIndicesWhenGivenArrayOfThreeElements() {
        // given
        let nums = [3, 2, 4], target = 6
        let expectedResult1 = [1, 2]
        let expectedResult2 = [2, 1]
        
        // when
        let actualResult = solution.twoSum(nums, target)
        
        // then
        XCTAssert(actualResult == expectedResult1 || actualResult == expectedResult2)
    }
    
    func testTwoSumReturnsTwoIndicesWhenGivenArrayOfTwoElements() {
        // given
        let nums = [3, 3], target = 6
        let expectedResult1 = [0, 1]
        let expectedResult2 = [1, 0]
        
        // when
        let actualResult = solution.twoSum(nums, target)
        
        // then
        XCTAssert(actualResult == expectedResult1 || actualResult == expectedResult2)
    }
}

SolutionTests.defaultTestSuite.run()
