/**
 1929. Concatenation of Array
 Easy
 https://leetcode.com/problems/concatenation-of-array/
 
 Given an integer array nums of length n, you want to create an array ans of length 2n where ans[i] == nums[i] and ans[i + n] == nums[i] for 0 <= i < n (0-indexed).
 Specifically, ans is the concatenation of two nums arrays.
 Return the array ans.

 Example 1:
 Input: nums = [1,2,1]
 Output: [1,2,1,1,2,1]
 
 Explanation: The array ans is formed as follows:
 - ans = [nums[0],nums[1],nums[2],nums[0],nums[1],nums[2]]
 - ans = [1,2,1,1,2,1]
 
 Example 2:
 Input: nums = [1,3,2,1]
 Output: [1,3,2,1,1,3,2,1]
 
 Explanation: The array ans is formed as follows:
 - ans = [nums[0],nums[1],nums[2],nums[3],nums[0],nums[1],nums[2],nums[3]]
 - ans = [1,3,2,1,1,3,2,1]

 Constraints:
 n == nums.length
 1 <= n <= 1000
 1 <= nums[i] <= 1000
 */

import XCTest

class Solution {
    
    // easiest short solution
    // time complexity `O(n)` where `n` is the lenght of the given array.
    // space complexity `O(1)`
    func getConcatenationEasiest(_ nums: [Int]) -> [Int] {
        nums + nums
    }
    
    // the solution using appending method of Array
    // time complexity `O(n)` where `n` is the lenght of the given array.
    // space complexity `O(n)`
    func getConcatenationAppending(_ nums: [Int]) -> [Int] {
        var ans = nums
        ans.append(contentsOf: nums)
        
        return ans
    }
    
    // the solution using an array with predifined size and a loop.
    // time complexity `O(n)` where `n` is the lenght of the given array.
    // space complexity `O(n)`
    func getConcatenationWithPredifinedArrayAndLoop(_ nums: [Int]) -> [Int] {
        let numsCount = nums.count
        var ans = Array(repeating: 0, count: numsCount * 2)
        
        for (index, element) in nums.enumerated() {
            ans[index] = element
            ans[index + numsCount] = element
        }
        
        return ans
    }
    
    // the solution using a classic loop. Can be usefull when we need more than 2 time concatenation
    // time complexity `O(n)` where `n` is the lenght of the given array.
    // space complexity `O(n)`
    func getConcatenationWithLoop(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        let numberOfConcatenation = 2
        
        for _ in 0..<numberOfConcatenation {
            for num in nums {
                ans.append(num)
            }
        }
        
        return ans
    }
}

class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func testGetConcatenationEasiestReturnsRightResultWhenGivenArrayOfThreeElements() {
        // given
        let nums = [1,2,1]
        let expectedValue = [1,2,1,1,2,1]
        
        // when
        let actualValue = solution.getConcatenationEasiest(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetConcatenationEasiestReturnsRightResultWhenGivenArrayOfFourElements() {
        // given
        let nums = [1,3,2,1]
        let expectedValue = [1,3,2,1,1,3,2,1]
        
        // when
        let actualValue = solution.getConcatenationEasiest(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetConcatenationAppendingReturnsRightResultWhenGivenArrayOfThreeElements() {
        // given
        let nums = [1,2,1]
        let expectedValue = [1,2,1,1,2,1]
        
        // when
        let actualValue = solution.getConcatenationAppending(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetConcatenationAppendingReturnsRightResultWhenGivenArrayOfFourElements() {
        // given
        let nums = [1,3,2,1]
        let expectedValue = [1,3,2,1,1,3,2,1]
        
        // when
        let actualValue = solution.getConcatenationAppending(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetConcatenationWithPredifinedArrayAndLoopReturnsRightResultWhenGivenArrayOfThreeElements() {
        // given
        let nums = [1,2,1]
        let expectedValue = [1,2,1,1,2,1]
        
        // when
        let actualValue = solution.getConcatenationWithPredifinedArrayAndLoop(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetConcatenationWithPredifinedArrayAndLoopReturnsRightResultWhenGivenArrayOfFourElements() {
        // given
        let nums = [1,3,2,1]
        let expectedValue = [1,3,2,1,1,3,2,1]
        
        // when
        let actualValue = solution.getConcatenationWithPredifinedArrayAndLoop(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetConcatenationWithLoopReturnsRightResultWhenGivenArrayOfThreeElements() {
        // given
        let nums = [1,2,1]
        let expectedValue = [1,2,1,1,2,1]
        
        // when
        let actualValue = solution.getConcatenationWithLoop(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetConcatenationWithLoopReturnsRightResultWhenGivenArrayOfFourElements() {
        // given
        let nums = [1,3,2,1]
        let expectedValue = [1,3,2,1,1,3,2,1]
        
        // when
        let actualValue = solution.getConcatenationWithLoop(nums)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
}

SolutionTests.defaultTestSuite.run()
