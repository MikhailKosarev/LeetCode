/*
 https://leetcode.com/problems/check-if-one-string-swap-can-make-strings-equal/?envType=study-plan&id=programming-skills-i
 1790. Check if One String Swap Can Make Strings Equal
 Easy

 You are given two strings s1 and s2 of equal length. A string swap is an operation where you choose two indices in a string (not necessarily different) and swap the characters at these indices.

 Return true if it is possible to make both strings equal by performing at most one string swap on exactly one of the strings. Otherwise, return false.

 Example 1:
 Input: s1 = "bank", s2 = "kanb"
 Output: true
 Explanation: For example, swap the first character with the last character of s2 to make "bank".
 
 Example 2:
 Input: s1 = "attack", s2 = "defend"
 Output: false
 Explanation: It is impossible to make them equal with one string swap.
 
 Example 3:
 Input: s1 = "kelb", s2 = "kelb"
 Output: true
 Explanation: The two strings are already equal, so no string swap operation is required.

 Constraints:
 1 <= s1.length, s2.length <= 100
 s1.length == s2.length
 s1 and s2 consist of only lowercase English letters.
 */

class Solution {
    // time complexity O(n * logn), where n is the length of the longest given string
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        // check if strings are equal, then immediately return true
        guard s1 != s2 else { return true }
        // check if characters in these string are equal, else immediately return false
        guard s1.sorted() == s2.sorted() else { return false }
        // define counter
        var count = 0
        // create for loop to compare characters
        for (index, char) in s1.enumerated() {
            // get index of character in the second string
            let index = s2.index(s2.startIndex, offsetBy: index)
            // check if characters are not equal
            if char != s2[index] {
                // if they are not equal increase the counter
                count += 1
            }
            // if counter is bigger than two, then immediately return false
            guard count <= 2 else { return false }
        }
        // if counter is equal 2 then return true
        return count == 2
    }
}

let solution = Solution()
let s1 = "caa", s2 = "aaz"
solution.areAlmostEqual(s1, s2)
