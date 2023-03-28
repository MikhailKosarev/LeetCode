/*
 https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/
 1342. Number of Steps to Reduce a Number to Zero
 Easy

 Given an integer num, return the number of steps to reduce it to zero.
 In one step, if the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.

 Example 1:
 Input: num = 14
 Output: 6
 Explanation:
 Step 1) 14 is even; divide by 2 and obtain 7.
 Step 2) 7 is odd; subtract 1 and obtain 6.
 Step 3) 6 is even; divide by 2 and obtain 3.
 Step 4) 3 is odd; subtract 1 and obtain 2.
 Step 5) 2 is even; divide by 2 and obtain 1.
 Step 6) 1 is odd; subtract 1 and obtain 0.
 
 Example 2:
 Input: num = 8
 Output: 4
 Explanation:
 Step 1) 8 is even; divide by 2 and obtain 4.
 Step 2) 4 is even; divide by 2 and obtain 2.
 Step 3) 2 is even; divide by 2 and obtain 1.
 Step 4) 1 is odd; subtract 1 and obtain 0.
 
 Example 3:
 Input: num = 123
 Output: 12
  
 Constraints:
 0 <= num <= 106
 */


// simple solution with while statement
// time complexity O(log n), where n is the given number
class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        // create counter and result variables
        var counter = 0, result = num
        // run while loop
        while result != 0 {
            // check if the number is odd
            if result % 2 == 0 {
                // if true then divide by 2
                result = result / 2
            } else {
                // otherwise subtract 1
                result = result - 1
            }
            // increment the counter
            counter += 1
        }
        // return final number of steps
        return counter
    }
}

let solution = Solution()
solution.numberOfSteps(5)
