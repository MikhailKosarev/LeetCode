/*
 https://leetcode.com/problems/happy-number/?envType=study-plan&id=programming-skills-i
 202. Happy Number
 Easy

 Write an algorithm to determine if a number n is happy.
 A happy number is a number defined by the following process:
 Starting with any positive integer, replace the number by the sum of the squares of its digits.
 Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
 Those numbers for which this process ends in 1 are happy.
 Return true if n is a happy number, and false if not.

 Example 1:
 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 
 Example 2:
 Input: n = 2
 Output: false
  
 Constraints:
 1 <= n <= 231 - 1
 */
import Foundation

class Solution {
    
    // easy additional function to get the sum of squarted digits
    // time complexity = O(n), where n is the number of digits in the given number
    func getSum(_ num: Int) -> Int {
        // create an array of digits from number
        let digits = String(num).compactMap { $0.wholeNumberValue }
        // get the sum of all squared elements
        let sum = digits.reduce(0, { $0 + $1 * $1 })
        // return sum
        return sum
    }
    
    // solution with Set to check infinite loop
    // time complexity = O(n), where n is the given number
    func isHappy(_ n: Int) -> Bool {
        // define an empty set to check
        var sumSet: Set<Int> = []
        // create new variable with sum is equal n on this step
        var sum = n
        // while sum isn't equal 1 go through the loop
        while sum != 1 {
            // check if we have the same sum in the set (if we have - it means that it loops endlessly in a cycle
            guard !sumSet.contains(sum) else { return false }
            // add sum to our set
            sumSet.insert(sum)
            // get the new sum
            sum = getSum(sum)
        }
        // if sum us eqial 1 then return true
        return true
    }
    
    // solution with adapting Floyd Cycle detection algorithm
    // time complexity = O(logn), where n is the given number
    func isHappyFloyd(_ n: Int) -> Bool {
        // define fast and slow "sums"
        var slow = n, fast = n
        // create repeate/while loop
        repeat {
            // get slow sum
            slow = getSum(slow)
            // get fast sum
            fast = getSum(getSum(fast))
            // check if slow sum isn\t equal 1 else return true
            guard slow != 1 else { return true }
        // check i int's not infinite loop (when slow is equal fast)
        } while slow != fast
        // if loop is infinite - return false
        return false
    }
}

let solution = Solution()


solution.getSum(151)
let n = 1111111
solution.isHappy(n)
solution.isHappyFloyd(n)
