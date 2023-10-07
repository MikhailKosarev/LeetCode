/**
 125. Valid Palindrome
 Easy
 https://leetcode.com/problems/valid-palindrome/
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 
 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.

 Constraints:
 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 */
import XCTest

class Solution {
    /// Straight solution with using Swift built-in functions.
    /// - Complexity: Time complexity: `O(n)` where `n` is the length of the given string.
    /// Space complexity: `O(n)` where `n` is the length of the given string.
    func isPalindrome(_ s: String) -> Bool {
        let filteredS = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return filteredS == String(filteredS.reversed())
    }
    
    /// Straight solution with two-pointers without using extra memory.
    /// - Complexity: Time complexity: `O(n)` where `n` is the length of the given string.
    /// Space complexity: `O(1)`
    func isPalindromeTwoPointers(_ s: String) -> Bool {
        var pointer1 = s.startIndex
        var pointer2 = s.index(before: s.endIndex)
        
        while pointer1 < pointer2 {
            
            while pointer1 < pointer2 && !isAlphanumeric(s[pointer1]) {
                pointer1 = s.index(after: pointer1)
            }
            
            while pointer1 < pointer2 && !isAlphanumeric(s[pointer2]) {
                pointer2 = s.index(before: pointer2)
            }
            
            guard s[pointer1].lowercased() == s[pointer2].lowercased() else { return false }
            guard pointer1 < s.endIndex && pointer2 > s.startIndex else { return true }
            
            pointer1 = s.index(after: pointer1)
            pointer2 = s.index(before: pointer2)
        }
        
        return true
    }
    
    private func isAlphanumeric(_ letter: Character) -> Bool {
        return letter.isLetter || letter.isNumber
    }
}

class SolutionTests: XCTestCase {
    
    private let solution = Solution()
    
    func test_isPalindrome_ReturnsTrueWhenGivenPalindromString() {
        // given
        let s = "A man, a plan, a canal: Panama"
        
        // when
        let result = solution.isPalindrome(s)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isPalindrome_ReturnsFalseWhenGivenNotPalindromString() {
        // given
        let s = "race a car"
        
        // when
        let result = solution.isPalindrome(s)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isPalindrome_ReturnsTrueWhenGivenAnEmptyString() {
        // given
        let s = " "
        
        // when
        let result = solution.isPalindrome(s)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isPalindromeTwoPointers_ReturnsTrueWhenGivenPalindromString() {
        // given
        let s = "A man, a plan, a canal: Panama"
        
        // when
        let result = solution.isPalindromeTwoPointers(s)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isPalindromeTwoPointers_ReturnsFalseWhenGivenNotPalindromString() {
        // given
        let s = "race a car"
        
        // when
        let result = solution.isPalindromeTwoPointers(s)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isPalindromeTwoPointers_ReturnsTrueWhenGivenAnEmptyString() {
        // given
        let s = " "
        
        // when
        let result = solution.isPalindromeTwoPointers(s)
        
        // then
        XCTAssertTrue(result)
    }
}

SolutionTests.defaultTestSuite.run()
