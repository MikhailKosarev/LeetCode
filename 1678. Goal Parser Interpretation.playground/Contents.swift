/*
 https://leetcode.com/problems/goal-parser-interpretation/
 1678. Goal Parser Interpretation
 Easy

 You own a Goal Parser that can interpret a string command. The command consists of an alphabet of "G", "()" and/or "(al)" in some order. The Goal Parser will interpret "G" as the string "G", "()" as the string "o", and "(al)" as the string "al". The interpreted strings are then concatenated in the original order.
 Given the string command, return the Goal Parser's interpretation of command.

 Example 1:
 Input: command = "G()(al)"
 Output: "Goal"
 Explanation: The Goal Parser interprets the command as follows:
 G -> G
 () -> o
 (al) -> al
 The final concatenated result is "Goal".
 
 Example 2:
 Input: command = "G()()()()(al)"
 Output: "Gooooal"
 
 Example 3:
 Input: command = "(al)G(al)()()G"
 Output: "alGalooG"

 Constraints:
 1 <= command.length <= 100
 command consists of "G", "()", and/or "(al)" in some order.
 */
import Foundation

class Solution {
    // straight solution
    // time complexity = O(n)
    // space complexity = O(2n)
    func interpret(_ command: String) -> String {
        // create an array from input string
        var commandArray = Array(command)
        // define result string variable
        var result = ""
        // create counter
        var index = 0
        // iterate array
        while index < commandArray.count {
            // check current letter
            switch commandArray[index] {
                // if it's "(" then check next letter
            case "(":
                // if next letter is ")"
                if commandArray[index + 1] == ")" {
                    // then append to result string "o"
                    result.append("o")
                    // and increment index by 2
                    index += 2
                } else {
                    // then append to result string "al"
                    result.append("al")
                    // and increment index by 4
                    index += 4
                }
                // in default case the current letter is "G"
            default:
                // then just append to result string "G"
                result.append("G")
                // and increment index by 1
                index += 1
            }
        }
        // return result string
        return result
    }
    
    // short written solution
    // time complexity - not sure, but think O(2n)
    // space complexity = O(1)
    func interpretShort(_ command: String) -> String {
        return command.replacingOccurrences(of: "()", with: "o")
            .replacingOccurrences(of: "(al)", with: "al")
    }
}

let solution = Solution()
let command = "G()(al)"
solution.interpret(command)
solution.interpretShort(command)
