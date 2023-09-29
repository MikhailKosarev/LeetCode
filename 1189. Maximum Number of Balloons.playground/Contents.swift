/*
 1189. Maximum Number of Balloons
 Easy
 https://leetcode.com/problems/maximum-number-of-balloons/

 Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.
 You can use each character in text at most once. Return the maximum number of instances that can be formed.

 Example 1:
 Input: text = "nlaebolko"
 Output: 1
 
 Example 2:
 Input: text = "loonbalxballpoon"
 Output: 2
 
 Example 3:
 Input: text = "leetcode"
 Output: 0

 Constraints:
 1 <= text.length <= 104
 text consists of lower case English letters only.
 */

import XCTest

class Solution {
    // time complexity `O(n)` where `n` is the length of the given `text`
    // space complexity `O(n)` where `n` is the length of the given `text`
    func maxNumberOfBalloons(_ text: String) -> Int {
        let balloonLetters = Set("balloon")
        
        var textToBalloonLettersMap = [Character: Int]()
        
        for char in text where balloonLetters.contains(char) {
            textToBalloonLettersMap[char, default: 0] += 1
        }
        if textToBalloonLettersMap["l"] != nil { textToBalloonLettersMap["l"]! /= 2 }
        if textToBalloonLettersMap["o"] != nil { textToBalloonLettersMap["o"]! /= 2 }
        
        guard balloonLetters.count == textToBalloonLettersMap.keys.count else { return 0 }
        return textToBalloonLettersMap.values.min() ?? 0
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_maxNumberOfBalloons_ReturnsExpectedValueWhenMaxNumberIsOne() {
        // given
        let text = "nlaebolko"
        let expectedResult = 1
        
        // when
        let actualResult = solution.maxNumberOfBalloons(text)
        
        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func test_maxNumberOfBalloons_ReturnsExpectedValueWhenMaxNumberIsTwo() {
        // given
        let text = "loonbalxballpoon"
        let expectedResult = 2
        
        // when
        let actualResult = solution.maxNumberOfBalloons(text)
        
        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func test_maxNumberOfBalloons_ReturnsExpectedValueWhenMaxNumberIsZero() {
        // given
        let text = "leetcode"
        let expectedResult = 0
        
        // when
        let actualResult = solution.maxNumberOfBalloons(text)
        
        // then
        XCTAssertEqual(actualResult, expectedResult)
    }
}

SolutionTests.defaultTestSuite.run()
