/**
 680. Valid Palindrome II
 Easy
 https://leetcode.com/problems/valid-palindrome-ii/

 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

 Example 1:
 Input: s = "aba"
 Output: true
 
 Example 2:
 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 
 Example 3:
 Input: s = "abc"
 Output: false

 Constraints:
 1 <= s.length <= 105
 s consists of lowercase English letters.
 */
import XCTest

class Solution {
    /// - Complexity: Time complexity: `O(n)` where `n` is the length of the given string.
    /// Space complexity: `O(n)` where `n` is the length of the given string.
    func validPalindrome(_ s: String) -> Bool {
        var pointer1 = s.startIndex
        var pointer2 = s.index(before: s.endIndex)

        while pointer1 < pointer2 {
            if s[pointer1] != s[pointer2] {
                var skipL = s
                skipL.remove(at: pointer1)
                var skipR = s
                skipR.remove(at: pointer2)
                return skipL == String(skipL.reversed()) || skipR == String(skipR.reversed())
            } else {
                pointer1 = s.index(after: pointer1)
                pointer2 = s.index(before: pointer2)
            }
        }
        return true
    }
}

class SolutionTests: XCTestCase {
    private let solution = Solution()
    
    func test_validPalindrome_ReturnsTrueWhenGivenPalindromeWithoutDeletingCharacter() {
        // given
        let s = "aba"
        
        // when
        let result = solution.validPalindrome(s)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_validPalindrome_ReturnsTrueWhenGivenPalindromeWithDeletingCharacter() {
        // given
        let s = "abca"
        
        // when
        let result = solution.validPalindrome(s)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_validPalindrome_ReturnsFalseWhenGivenNonPalindrome() {
        // given
        let s = "abc"
        
        // when
        let result = solution.validPalindrome(s)
        
        // then
        XCTAssertFalse(result)
    }
}

SolutionTests.defaultTestSuite.run()
