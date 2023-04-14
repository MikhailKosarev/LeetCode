/*
 https://leetcode.com/problems/decrypt-string-from-alphabet-to-integer-mapping/
 1309. Decrypt String from Alphabet to Integer Mapping
 Easy

 You are given a string s formed by digits and '#'. We want to map s to English lowercase characters as follows:
 Characters ('a' to 'i') are represented by ('1' to '9') respectively.
 Characters ('j' to 'z') are represented by ('10#' to '26#') respectively.
 Return the string formed after mapping.
 The test cases are generated so that a unique mapping will always exist.

 Example 1:
 Input: s = "10#11#12"
 Output: "jkab"
 Explanation: "j" -> "10#" , "k" -> "11#" , "a" -> "1" , "b" -> "2".
 
 Example 2:
 Input: s = "1326#"
 Output: "acz"
  
 Constraints:
 1 <= s.length <= 1000
 s consists of digits and the '#' letter.
 s will be a valid string such that mapping is always possible.
 */

class Solution {
    // straight solution
    // time complexity = O(n), where n is the length of `s`
    func freqAlphabets(_ s: String) -> String {
        // define an empty result string
        var result = ""
        // define counter
        var i = 0
        // start iterate the input string "s"
        while i < s.count {
            // define current number variable
            var currentNumber = 0
            // check if index+2 element equals "#"
            if ((i + 2) < s.count) && (s[s.index(s.startIndex, offsetBy: (i + 2))] == "#") {
                // then get two numbers before "$" sign
                currentNumber = Int(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i + 2)])!
                // increase counter by 3
                i += 3
            } else {
                // otherwise get one number
                currentNumber = Int(String((s[s.index(s.startIndex, offsetBy: i)])))!
                // increase counter by 1
                i += 1
            }
            // convert our number to letter and append it ti the result string
            result.append(String(Character(UnicodeScalar(96 + currentNumber)!)))
        }
        // return the result string
        return result
    }
}

let solution = Solution()
let s = "1326#"
solution.freqAlphabets(s)
