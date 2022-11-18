/*
 https://leetcode.com/problems/running-sum-of-1d-array/
 1480. Running Sum of 1d Array
 Easy

 Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
 Return the running sum of nums.

 Example 1:
 Input: nums = [1,2,3,4]
 Output: [1,3,6,10]
 Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
 
 Example 2:
 Input: nums = [1,1,1,1,1]
 Output: [1,2,3,4,5]
 Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
 
 Example 3:
 Input: nums = [3,1,2,10,1]
 Output: [3,4,6,16,17]

 Constraints:

 1 <= nums.length <= 1000
 -10^6 <= nums[i] <= 10^6
*/

class Solution {
    // first solution with new array
    // time complexity = O(n)
    func runningSum(_ nums: [Int]) -> [Int] {
        // create new array
        var sums = [Int]()
        // add first number
        sums.append(nums[0])
        // count running sum of other numbers
        for i in 1..<nums.count {
            sums.append(nums[i] + sums[i - 1])
        }
        return sums
    }
    
    // second solution with changing the current array
    // time complexity = O(n)
    func runningSum2(_ nums: inout [Int]) -> [Int] {
        // count running sum of other numbers
        for i in 1..<nums.count {
            nums[i] += nums[i - 1]
        }
        return nums
    }
}

let solution = Solution()
var nums = [1, 2, 3, 4]
solution.runningSum(nums)
solution.runningSum2(&nums)
