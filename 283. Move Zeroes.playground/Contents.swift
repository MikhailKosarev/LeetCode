/*
 https://leetcode.com/problems/move-zeroes/?envType=study-plan&id=programming-skills-i
 283. Move Zeroes
 Easy

 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 Note that you must do this in-place without making a copy of the array.

 Example 1:
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Example 2:
 Input: nums = [0]
 Output: [0]

 Constraints:
 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1

 Follow up: Could you minimize the total number of operations done?
 */

class Solution {
    // solution with high order function
    // time complexity O(n)
    func moveZeroes(_ nums: inout [Int]) {
        // count of nums in original array
        var count = nums.count
        // filter non-zero elements
        nums = nums.filter {$0 != 0}
        // calculate how many zeros we need to add
        count = count - nums.count
        // add zeros to the end of the array
        nums.append(contentsOf: Array(repeating: 0, count: count))
    }
    
    // second solution with while loop
    // time complexity O(n) worst case
    func moveZeroesSecond(_ nums: inout [Int]) {
        // define zero counter and iterator
        var zeroCounter = 0, i = 0
        // iterate the original array except of last zeros
        while i < nums.count - zeroCounter {
            // check if current num equals zero
            if nums[i] == 0 {
                // if true then
                // increment zero counter
                zeroCounter += 1
                // remove zero and append to the end
                nums.append(nums.remove(at: i))
            } else {
                // else increment iterator
                i += 1
            }
        }
    }
}

let solution = Solution()
var nums = [0,1,0,3,12]
//solution.moveZeroes(&nums)
solution.moveZeroesSecond(&nums)
nums
