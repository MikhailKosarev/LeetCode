/*
 977. Squares of a Sorted Array
 https://leetcode.com/problems/squares-of-a-sorted-array/
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

 Example 1:
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 
 Example 2:
 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
  
 Constraints:
 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in non-decreasing order.

 Follow up: Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?
 */

class Solution {
    // trivial solution
    // time complexity = O(n * logn), where n is the length of `nums`
    func sortedSquares(_ nums: [Int]) -> [Int] {
        nums
            .map { $0 * $0 }
            .sorted()
    }
    
    // solution with two pointers
    // more code, but time complexity = O(n), where n is the length of `nums`
    func sortedSquaresFast(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var leftPointer = 0
        var rightPointer = nums.count - 1
        
        while leftPointer <= rightPointer {
            let leftNumAbs = abs(nums[leftPointer])
            let rightNumAbs = abs(nums[rightPointer])
            
            if rightNumAbs >= leftNumAbs {
                rightPointer -= 1
                result.append(rightNumAbs * rightNumAbs)
            } else {
                leftPointer += 1
                result.append(leftNumAbs * leftNumAbs)
            }
        }
        
        return result.reversed()
    }
    
    // solution with two pointers
    // less code, but less readability
    // time complexity the same = O(n), where n is the length of `nums`
    func sortedSquaresFastLessCode(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var leftPointer = 0
        var rightPointer = nums.count - 1
        
        while leftPointer <= rightPointer {
            let leftNumAbs = abs(nums[leftPointer])
            let rightNumAbs = abs(nums[rightPointer])
            
            rightNumAbs >= leftNumAbs ? (rightPointer -= 1) : (leftPointer += 1)

            result.append(max((rightNumAbs * rightNumAbs), (leftNumAbs * leftNumAbs)))
        }
        
        return result.reversed()
    }
}


let solution = Solution()
let nums = [-4,-1,0,3,10]
solution.sortedSquares(nums)
solution.sortedSquaresFast(nums)
solution.sortedSquaresFastLessCode(nums)
