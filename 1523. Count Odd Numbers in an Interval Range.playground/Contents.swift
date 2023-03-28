/*
 https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/?envType=study-plan&id=programming-skills-i
 1523. Count Odd Numbers in an Interval Range
 Easy

 Given two non-negative integers low and high. Return the count of odd numbers between low and high (inclusive).

 Example 1:
 Input: low = 3, high = 7
 Output: 3
 Explanation: The odd numbers between 3 and 7 are [3,5,7].
 
 Example 2:
 Input: low = 8, high = 10
 Output: 1
 Explanation: The odd numbers between 8 and 10 are [9].
  
 Constraints:
 0 <= low <= high <= 10^9
 */

class Solution {
    // simpliest solution
    // time complexity = O(n), where n is the difference between low and high
    func countOdds(_ low: Int, _ high: Int) -> Int {
        // define count variable
        var count = 0
        // iterate the range
        for number in low...high {
            // check if the current number is odd
            if number % 2 != 0 {
                // if true, increase the count
                count += 1
            }
        }
        // return final count
        return count
    }
    
    // fast solution
    // time complexity = O(1)
    func countOddsFast(_ low: Int, _ high: Int) -> Int {
        // low or high is odd
        if low % 2 != 0 || high % 2 != 0 {
            return (high - low) / 2 + 1
        } else {
            // both low and high are even numbers
            return (high - low) / 2
        }
    }
}

let solution = Solution()
solution.countOdds(3, 7)
solution.countOddsFast(3, 7)
