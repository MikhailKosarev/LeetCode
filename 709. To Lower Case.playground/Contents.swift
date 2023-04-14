/*
 https://leetcode.com/problems/to-lower-case/
 709. To Lower Case
 Easy
 
 Given a string s, return the string after replacing every uppercase letter with the same lowercase letter.
 
 Example 1:
 Input: s = "Hello"
 Output: "hello"
 
 Example 2:
 Input: s = "here"
 Output: "here"
 
 Example 3:
 Input: s = "LOVELY"
 Output: "lovely"
 
 Constraints:
 1 <= s.length <= 100
 s consists of printable ASCII characters.
 */

class Solution {
    // solution with standart function
    // time complexity O(n)
    func toLowerCase(_ s: String) -> String {
        return s.lowercased()
    }
    
    // solution without standart function "lowercased"
    // time complexity = O(n), where n is the length of `s`
    // space complexity = O(n), where n is the length of `s`
    func toLowerCaseNoLibrary(_ s: String) -> String {
        // define an empty String for result value
        var result = ""
        // iterate each character of the "s"
        s.forEach {
            // check if can get ascii value and if it's ascii value is in the range 65...90
            if let ascii = $0.asciiValue,
            ascii >= 65 && ascii <= 90 {
                // if true, then the current letter is uooercased and we add to the final string it's lowercased variant
                result.append(Character(UnicodeScalar(ascii + 32)))
            } else {
                // otherwise add original letter
                result.append($0)
            }
        }
        // return the result string
        return result
    }
}

let solution = Solution()
let s = "Hello"
solution.toLowerCase(s)
solution.toLowerCaseNoLibrary(s)
