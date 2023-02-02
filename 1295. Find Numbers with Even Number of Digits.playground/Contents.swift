/*
 1295. Find Numbers with Even Number of Digits
 https://leetcode.com/problems/find-numbers-with-even-number-of-digits/
 Given an array nums of integers, return how many of them contain an even number of digits.

 Example 1:
 Input: nums = [12,345,2,6,7896]
 Output: 2
 
 Explanation:
 12 contains 2 digits (even number of digits).
 345 contains 3 digits (odd number of digits).
 2 contains 1 digit (odd number of digits).
 6 contains 1 digit (odd number of digits).
 7896 contains 4 digits (even number of digits).
 Therefore only 12 and 7896 contain an even number of digits.
 
 Example 2:
 Input: nums = [555,901,482,1771]
 Output: 1
 
 Explanation:
 Only 1771 contains an even number of digits.

 Constraints:
 1 <= nums.length <= 500
 1 <= nums[i] <= 105
 */

// first solution with for loop
// time complexity = O(n*m)
class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        var maxEven = 0
        for num in nums {
            var newNum = num
            var currentCounter = 0
            
            while newNum != 0 {
                newNum = newNum / 10
                currentCounter += 1
            }
            
            if currentCounter % 2 == 0 {
                maxEven += 1
            }
        }
        return maxEven
    }
    
    // solution with using a converting to String to be able to use count method
    // time complexity = O(n)
    func findNumbersShort(_ nums: [Int]) -> Int {
        var count = 0
        for i in nums {
            count += String(i).count % 2 == 0 ? 1 : 0
        }
        return count
    }
    
    // solution with using a converting to String to be able to use count method and high order function to filter the array
    // time complexity = O(n)
    func findNumbersOneLiner(_ nums: [Int]) -> Int {
        nums.filter { String($0).count.isMultiple(of: 2) }.count
    }
}

let solution = Solution()
let nums = [12,345,2,6,7896]
solution.findNumbers(nums)
solution.findNumbersShort(nums)
solution.findNumbersOneLiner(nums)
