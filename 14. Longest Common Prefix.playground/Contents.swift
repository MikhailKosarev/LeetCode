/**
 14. Longest Common Prefix
 Easy
 https://leetcode.com/problems/longest-common-prefix/
 
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".

 Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.

 Constraints:
 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.
 */

import XCTest

class Solution {
    
    // time complexity `O(n*m)` where `n` is the length of the given array and `m` is the length of the longest word in the given array.
    // time complexity `O(1)`
    func longestCommonPrefix(_ strs: [String]) -> String {
        var commonPrefix = strs.first ?? ""
        
        for word in strs.dropFirst() {
            while !word.hasPrefix(commonPrefix) {
                commonPrefix.removeLast()
            }
        }
        
        return commonPrefix
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_longestCommonPrefix_ReturnsExpectedValueWhenGivenArrayWithCommonPrefix() {
        // given
        let strs = ["flower","flow","flight"]
        let expectedValue = "fl"
        
        // when
        let actualResult = solution.longestCommonPrefix(strs)
        
        // then
        XCTAssertEqual(expectedValue, actualResult)
    }
    
    func test_longestCommonPrefix_ReturnsAnEmptyStringWhenGivenArrayWithNoCommonPrefix() {
        // given
        let strs = ["dog","racecar","car"]
        let expectedValue = ""
        
        // when
        let actualResult = solution.longestCommonPrefix(strs)
        
        // then
        XCTAssertEqual(expectedValue, actualResult)
    }
}

SolutionTests.defaultTestSuite.run()
