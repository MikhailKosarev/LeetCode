/**
 392. Is Subsequence
 Easy
 https://leetcode.com/problems/is-subsequence/

 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 Example 1:
 Input: s = "abc", t = "ahbgdc"
 Output: true
 
 Example 2:
 Input: s = "axc", t = "ahbgdc"
 Output: false
  
 Constraints:
 0 <= s.length <= 100
 0 <= t.length <= 104
 s and t consist only of lowercase English letters.

 Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?
 */
import XCTest

class Solution {
    // Use default String's indexing and two pointers method
    // Time complexity: `O(n)` where `n` is the lenght of the longest string.
    // Space complexity: `O(1)`, we don't need extra space.
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var pointer1 = s.startIndex
        var pointer2 = t.startIndex

        while pointer1 < s.endIndex && pointer2 < t.endIndex {
            if s[pointer1] == t[pointer2] {
                pointer1 = s.index(after: pointer1)
            }
            pointer2 = t.index(after: pointer2)
        }
        
        return pointer1 == s.endIndex
    }
    
    // Solution using extra memory for easies iterating without String's indices
    // Time complexity: `O(n)` where `n` is the lenght of the longest string.
    // Space complexity: `O(s)`, where `s` is the lenght of the string `s`.
    func isSubsequenceWithArray(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else { return true }
        
        let arrayS = Array(s)
        var pointerS = 0
        
        for letter in t {
            if letter == arrayS[pointerS] {
                pointerS += 1
                guard pointerS != arrayS.count else { return true }
            }
        }
        return false
    }
}

class SolutuonTests: XCTestCase {
    let solution = Solution()
    
    func test_isSubsequenceReturnsTrueIfGivenStringIsSubsequence() {
        // given
        let s = "abc", t = "ahbgdc"

        // when
        let result = solution.isSubsequence(s, t)

        // then
        XCTAssertTrue(result)
    }

    func test_isSubsequenceReturnsFalseIfGivenStringIsNotSubsequence() {
        // given
        let s = "axc", t = "ahbgdc"
        
        // when
        let result = solution.isSubsequence(s, t)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isSubsequenceWithArrayReturnsTrueIfGivenStringIsSubsequence() {
        // given
        let s = "abc", t = "ahbgdc"

        // when
        let result = solution.isSubsequence(s, t)

        // then
        XCTAssertTrue(result)
    }

    func test_isSubsequenceWithArrayReturnsFalseIfGivenStringIsNotSubsequence() {
        // given
        let s = "axc", t = "ahbgdc"
        
        // when
        let result = solution.isSubsequence(s, t)
        
        // then
        XCTAssertFalse(result)
    }
}

SolutuonTests.defaultTestSuite.run()
