/*
 290. Word Pattern
 Easy
 https://leetcode.com/problems/word-pattern/

 Given a pattern and a string s, find if s follows the same pattern.
 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

 Example 1:
 Input: pattern = "abba", s = "dog cat cat dog"
 Output: true
 
 Example 2:
 Input: pattern = "abba", s = "dog cat cat fish"
 Output: false
 
 Example 3:
 Input: pattern = "aaaa", s = "dog cat cat dog"
 Output: false

 Constraints:
 1 <= pattern.length <= 300
 pattern contains only lower-case English letters.
 1 <= s.length <= 3000
 s contains only lowercase English letters and spaces ' '.
 s does not contain any leading or trailing spaces.
 All the words in s are separated by a single space.
 */

import XCTest

class Solution {
    // time complexity: `O(n + m)` where `n` is the length of `pattern` and `m` is the length of `s`
    // space complexity: `O(n)` where `n` is the length of `pattern`
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.split(separator: " ")
        
        guard pattern.count == words.count else { return false }
                
        var letterToWord = [Character: String.SubSequence]()
        var wordToLetter = [String.SubSequence: Character]()
        
        for (letter, word) in zip(pattern, words) {
            if let patternWord = letterToWord[letter],
               patternWord != word { return false }
            
            if let patternLetter = wordToLetter[word],
                patternLetter != letter { return false }

            letterToWord[letter] = word
            wordToLetter[word] = letter
        }
        
        return true
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_wordPattern_ReturnsTrueWhenStringFollowThePattern() {
        // given
        let pattern = "abba", s = "dog cat cat dog"
        
        // when
        let result = solution.wordPattern(pattern, s)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_wordPattern_ReturnsFalseWhenStringDoesNotFollowThePatternInOneWord() {
        // given
        let pattern = "abba", s = "dog cat cat fish"
        
        // when
        let result = solution.wordPattern(pattern, s)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_wordPattern_ReturnsFalseWhenStringDoesNotFollowThePatternAtAll() {
        // given
        let pattern = "aaaa", s = "dog cat cat dog"
        
        // when
        let result = solution.wordPattern(pattern, s)
        
        // then
        XCTAssertFalse(result)
    }
}

SolutionTests.defaultTestSuite.run()
