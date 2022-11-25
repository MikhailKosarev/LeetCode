/*
 https://leetcode.com/problems/number-of-1-bits/?envType=study-plan&id=programming-skills-i
 191. Number of 1 Bits
 Easy

 Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

 Note:
 Note that in some languages, such as Java, there is no unsigned integer type. In this case, the input will be given as a signed integer type. It should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
 In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3, the input represents the signed integer. -3.
  
 Example 1:
 Input: n = 00000000000000000000000000001011
 Output: 3
 Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
 
 Example 2:
 Input: n = 00000000000000000000000010000000
 Output: 1
 Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
 
 Example 3:
 Input: n = 11111111111111111111111111111101
 Output: 31
 Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.

 Constraints:
 The input must be a binary string of length 32.

 Follow up: If this function is called many times, how would you optimize it?
 */

import Foundation

class Solution {
    // loop arythmetic solution
    // time complexity = O(n)
    func hammingWeight(_ n: UInt) -> UInt {
        var n = n, result: UInt = 0
        // check if it the last number
        while n != 0 {
            // add the remainder
            result += n % 2
            // divide by two for next loop
            n /= 2
        }
        return result
    }
    
    // recursion solution
    // time complexity = O(n)
    func hammingWeightRecursion(_ n: UInt) -> UInt {
        // base case if it's the last number
        if n == 0 {
            return 0
        }
        // add remainder and go deeper
        return (n % 2) + hammingWeightRecursion(n / 2)
    }
    
    // binary shifting solution
    // time complexity = O(n)
    func hammingWeightShift(_ n: UInt) -> UInt {
        var n = n, result: UInt = 0
        // check if it the last number
        while n != 0 {
            // The bitwise AND operator (&) combines the bits of two numbers. It returns a new number whose bits are set to 1 only if the bits were equal to 1 in both input numbers
            result += n & 1
            // shift to the right by 1 place
            n >>= 1
        }
        return result
    }
}

let solution = Solution()
let n: UInt = 0b00000000000000000000000000001011
solution.hammingWeight(n)
solution.hammingWeightRecursion(n)
solution.hammingWeightShift(n)
