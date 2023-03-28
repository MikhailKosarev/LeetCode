/*
 https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/?envType=study-plan&id=programming-skills-i
 
 1281. Subtract the Product and Sum of Digits of an Integer

 Given an integer number n, return the difference between the product of its digits and the sum of its digits.

 Example 1:
 Input: n = 234
 Output: 15
 Explanation:
 Product of digits = 2 * 3 * 4 = 24
 Sum of digits = 2 + 3 + 4 = 9
 Result = 24 - 9 = 15
 
 Example 2:
 Input: n = 4421
 Output: 21
 Explanation:
 Product of digits = 4 * 4 * 2 * 1 = 32
 Sum of digits = 4 + 4 + 2 + 1 = 11
 Result = 32 - 11 = 21

 Constraints:

 1 <= n <= 10^5
 */

import Foundation

class Solution {
    // straight solution
    // time complexity = O(n), where n is the number of digits in the given number
    func subtractProductAndSum(_ n: Int) -> Int {
        // define mutable n, product and sum variables
        var n = n, product = 1, sum = 0
        // loop for each digit
        while n > 0 {
            // get the last digit
            let remainder = n % 10
            // calculate product
            product *= remainder
            // calculate sum
            sum += remainder
            // get off the last digit
            n /= 10
        }
        // return subtraction
        return product - sum
    }
    
    // functional solution with high order functions
    // time complexity = O(n), where n is the number of digits in the given number
    func subtractProductAndSumSimple(_ n: Int) -> Int {
        // convert n to String and then to array of digits
        let arrayN = String(n).compactMap { $0.wholeNumberValue }
        // with "reduce" get production and sum and then return subtraction
        return arrayN.reduce(1, *) - arrayN.reduce(0, +)
    }
}

let solution = Solution()
let n = 234
solution.subtractProductAndSum(n)
solution.subtractProductAndSumSimple(n)
