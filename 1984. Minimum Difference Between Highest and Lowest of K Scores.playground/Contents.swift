/**
 1984. Minimum Difference Between Highest and Lowest of K Scores
 Easy
 https://leetcode.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/
 
 You are given a 0-indexed integer array nums, where nums[i] represents the score of the ith student. You are also given an integer k.
 Pick the scores of any k students from the array so that the difference between the highest and the lowest of the k scores is minimized.
 Return the minimum possible difference.

 Example 1:
 Input: nums = [90], k = 1
 Output: 0
 Explanation: There is one way to pick score(s) of one student:
 - [90]. The difference between the highest and lowest score is 90 - 90 = 0.
 The minimum possible difference is 0.
 
 Example 2:
 Input: nums = [9,4,1,7], k = 2
 Output: 2
 Explanation: There are six ways to pick score(s) of two students:
 - [9,4,1,7]. The difference between the highest and lowest score is 9 - 4 = 5.
 - [9,4,1,7]. The difference between the highest and lowest score is 9 - 1 = 8.
 - [9,4,1,7]. The difference between the highest and lowest score is 9 - 7 = 2.
 - [9,4,1,7]. The difference between the highest and lowest score is 4 - 1 = 3.
 - [9,4,1,7]. The difference between the highest and lowest score is 7 - 4 = 3.
 - [9,4,1,7]. The difference between the highest and lowest score is 7 - 1 = 6.
 The minimum possible difference is 2.

 Constraints:

 1 <= k <= nums.length <= 1000
 0 <= nums[i] <= 105
 */
import XCTest

class Solution {
    
    /// - Complexity: Time complexity: `O(n*logn)` where `n` is the length of `nums`.
    /// Space complexity: `O(n)` where `n` is the length of `nums`.
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted()
        
        var left = 0
        var right = left + k - 1
        var minimum = Int.max
        
        while right < sortedNums.endIndex {
            minimum = min(sortedNums[right] - sortedNums[left], minimum)
            left += 1
            right += 1
        }

        return minimum
    }
}

class SolutionTests: XCTestCase {
    private let solution = Solution()
    
    func test_minimumDifference_ReturnsExpectedResultWhenTheLengthOfTheGivenNumsIsMinimum() {
        // given
        let nums = [90]
        let k = 1
        let expectedResult = 0
        
        // when
        let actualResult = solution.minimumDifference(nums, k)
        
        // then
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_minimumDifference_ReturnsExpectedResultWhenGivenLongNums() {
        // given
        let nums = [9,4,1,7]
        let k = 2
        let expectedResult = 2
        
        // when
        let actualResult = solution.minimumDifference(nums, k)
        
        // then
        XCTAssertEqual(expectedResult, actualResult)
    }
}

SolutionTests.defaultTestSuite.run()
