/**
 58. Length of Last Word
 Easy
 https://leetcode.com/problems/length-of-last-word/

 Given a string s consisting of words and spaces, return the length of the last word in the string.
 A word is a maximal substring consisting of non-space characters only.

 Example 1:
 Input: s = "Hello World"
 Output: 5
 Explanation: The last word is "World" with length 5.
 
 Example 2:
 Input: s = "   fly me   to   the moon  "
 Output: 4
 Explanation: The last word is "moon" with length 4.
 
 Example 3:
 Input: s = "luffy is still joyboy"
 Output: 6
 Explanation: The last word is "joyboy" with length 6.
  
 Constraints:
 1 <= s.length <= 104
 s consists of only English letters and spaces ' '.
 There will be at least one word in s.
 */
import XCTest

class Solution {
    // solution using the default Swift library.
    // Time complexity `O(n)`, where `n` is the length of the given string.
    // Space complexity `O(n)`, where `n` is the length of the given string.
    func lengthOfLastWord(_ s: String) -> Int {
        let arrayS = s.split(separator: " ")
        let lastWord = arrayS.last
        return lastWord?.count ?? 0
    }
    
    // solution using a loop.
    // Time complexity `O(n)`, where `n` is the length of the given string.
    // Space complexity `O(1)`, we don't need extra memory.
    func lengthOfLastWordSecond(_ s: String) -> Int {
        var result = 0
        
        for character in s.reversed() {
            if character != " " {
                result += 1
            } else if result > 0 {
                return result
            }
        }
        
        return result
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_lengthOfLastWordReturnsExpectedResultWhenGivenTwoWordsSeparatedBySpace() {
        // given
        let s = "Hello World"
        let expectedValue = 5
        
        // when
        let actualValue = solution.lengthOfLastWord(s)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_lengthOfLastWordReturnsExpectedResultWhenGivenManyWordsAndManySpaces() {
        // given
        let s = "   fly me   to   the moon  "
        let expectedValue = 4
        
        // when
        let actualValue = solution.lengthOfLastWord(s)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_lengthOfLastWordReturnsExpectedResultWhenGivenFewWordsSeparatedBySpaces() {
        // given
        let s = "luffy is still joyboy"
        let expectedValue = 6
        
        // when
        let actualValue = solution.lengthOfLastWord(s)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_lengthOfLastWordSecond_ReturnsExpectedResultWhenGivenTwoWordsSeparatedBySpace() {
        // given
        let s = "Hello World"
        let expectedValue = 5
        
        // when
        let actualValue = solution.lengthOfLastWordSecond(s)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_lengthOfLastWordSecond_ReturnsExpectedResultWhenGivenManyWordsAndManySpaces() {
        // given
        let s = "   fly me   to   the moon  "
        let expectedValue = 4
        
        // when
        let actualValue = solution.lengthOfLastWordSecond(s)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_lengthOfLastWordSecond_ReturnsExpectedResultWhenGivenFewWordsSeparatedBySpaces() {
        // given
        let s = "luffy is still joyboy"
        let expectedValue = 6
        
        // when
        let actualValue = solution.lengthOfLastWordSecond(s)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
}

SolutionTests.defaultTestSuite.run()
