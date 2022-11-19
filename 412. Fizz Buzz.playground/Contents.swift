/*
 https://leetcode.com/problems/fizz-buzz/
 412. Fizz Buzz
 Easy

 Given an integer n, return a string array answer (1-indexed) where:

 answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
 answer[i] == "Fizz" if i is divisible by 3.
 answer[i] == "Buzz" if i is divisible by 5.
 answer[i] == i (as a string) if none of the above conditions are true.
  
 Example 1:
 Input: n = 3
 Output: ["1","2","Fizz"]
 
 Example 2:
 Input: n = 5
 Output: ["1","2","Fizz","4","Buzz"]
 
 Example 3:
 Input: n = 15
 Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
  
 Constraints:
 1 <= n <= 104
 */

class Solution {
    // first solution with switch/case statement using "true" as the tag
    // time complexity O(n)
    func fizzBuzz(_ n: Int) -> [String] {
        // create an empty array of String
        var array = [String]()
        // fill the array
        for i in 1...n {
            // check conditions with switch/case statement using "true" as the tag
            switch true {
            case (i % 3 == 0) && (i % 5 == 0): array.append("FizzBuzz")
            case (i % 3 == 0): array.append("Fizz")
            case (i % 5 == 0): array.append("Buzz")
            default: array.append("\(i)")
            }
        }
        return array
    }
}

let solution = Solution()
solution.fizzBuzz(5)
