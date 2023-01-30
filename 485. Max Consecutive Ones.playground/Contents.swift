/* https://leetcode.com/problems/max-consecutive-ones/description/

 485. Max Consecutive Ones
 Easy

 Given a binary array nums, return the maximum number of consecutive 1's in the array.

 Example 1:
 Input: nums = [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
 
 Example 2:
 Input: nums = [1,0,1,1,0,1]
 Output: 2

 Constraints:
 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
*/


class Solution {
    // straightforward solution with 'for' loop
    // time complexity = O(n)
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var currentNumber = 0
        var maxNumber = 0
        
        for value in nums {
            switch value {
            case 1:
                currentNumber += 1
                maxNumber = max(currentNumber, maxNumber)
            default:
                currentNumber = 0
            }
        }
        
        return maxNumber
    }
    
    // straightforward solution with high order function
    // time complexity = O(n)
    func findMaxConsecutiveOnesHigh(_ nums: [Int]) -> Int {
        var currentNumber = 0
        var maxNumber = 0
        
        nums.forEach { value in
            switch value {
            case 1:
                currentNumber += 1
                maxNumber = max(currentNumber, maxNumber)
            default:
                currentNumber = 0
            }
        }
        
        return maxNumber
    }
}

let solution = Solution()
solution.findMaxConsecutiveOnes([1,1,0,1,1,1])
solution.findMaxConsecutiveOnesHigh([1,1,0,1,1,1])
