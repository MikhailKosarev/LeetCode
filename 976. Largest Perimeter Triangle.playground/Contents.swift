/*
 https://leetcode.com/problems/largest-perimeter-triangle/?envType=study-plan&id=programming-skills-i
 
 976. Largest Perimeter Triangle
 Easy

 Given an integer array nums, return the largest perimeter of a triangle with a non-zero area, formed from three of these lengths. If it is impossible to form any triangle of a non-zero area, return 0.

 Example 1:
 Input: nums = [2,1,2]
 Output: 5
 
 Example 2:
 Input: nums = [1,2,1]
 Output: 0

 Constraints:
 3 <= nums.length <= 104
 1 <= nums[i] <= 106
 */

class Solution {
    // time complexity O(n * logn)
    func largestPerimeter(_ nums: [Int]) -> Int {
        // create a mutable cipy of nums and sort it decreasing
        let sorted = nums.sorted(by: >)
        // check three biggest numbers
        for i in 0..<sorted.count - 2 {
            // check three biggest number by the time on the loop
            if sorted[i] < (sorted[i + 1] + sorted[i + 2]) {
                // if true, then calculate and return the perimeter
                return sorted[i] + sorted[i + 1] + sorted[i + 2]
            }
        }
        // if there is no triangle then return zero
        return 0
    }
}

let solution = Solution()
let nums = [1,2,1]
solution.largestPerimeter(nums)


