/**
 205. Isomorphic Strings

 Given two strings s and t, determine if they are isomorphic.
 Two strings s and t are isomorphic if the characters in s can be replaced to get t.
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

 Example 1:
 Input: s = "egg", t = "add"
 Output: true
 
 Example 2:
 Input: s = "foo", t = "bar"
 Output: false
 
 Example 3:
 Input: s = "paper", t = "title"
 Output: true
  
 Constraints:
 1 <= s.length <= 5 * 104
 t.length == s.length
 s and t consist of any valid ascii character.
 */
import XCTest

class Solution {
    // time complexity O(n^2) where n is the length of the string
    // space complexity O(n) where n is the length of the string
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var hashTable = [Character: Character]()
        
        var indexS = s.startIndex
        var indexT = t.startIndex
        
        for _ in 0..<s.count {
            let charS = s[indexS]
            let charT = t[indexT]
            if let currentT = hashTable[charS] {
                guard currentT == charT else { return false }
            } else {
                // O(n^2) because of this string
                guard !hashTable.values.contains(charT) else { return false }
                hashTable[charS] = charT
            }
            
            indexS = s.index(after: indexS)
            indexT = t.index(after: indexT)
        }
        
        return true
    }
    
    // more efficient solution and using `zip`
    // time complexity `O(n)` where `n` is the length of the string
    // space complexity `O(n)` where `n` is the length of the string
    func isIsomorphicEfficient(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var mapST = [Character: Character]()
        var mapTS = [Character: Character]()
        
        for (charS, charT) in zip(s, t) {
            if let mappedCharT = mapST[charS],
               mappedCharT != charT { return false }
                
            if let mappedCharS = mapTS[charT],
               mappedCharS != charS { return false }
            
            mapST[charS] = charT
            mapTS[charT] = charS
        }
        
        return true
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_isIsomorphic_ReturnsTrueWhenStringsAreIsomorphicAndHaveRepeatedCharacters() {
        // given
        let s = "egg", t = "add"

        // when
        let result = solution.isIsomorphic(s, t)

        // then
        XCTAssertTrue(result)
    }
    
    func test_isIsomorphic_ReturnsFalseWhenStringsAreNotIsomorphic() {
        // given
        let s = "foo", t = "bar"
        
        // when
        let result = solution.isIsomorphic(s, t)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isIsomorphic_ReturnsTrueWhenStringsAreIsomorphic() {
        // given
        let s = "paper", t = "title"

        // when
        let result = solution.isIsomorphic(s, t)

        // then
        XCTAssertTrue(result)
    }
    
    func test_isIsomorphic_ReturnsFalseWhenGivenTwoNonIsomorphicStringsWithRepeatedCharactersInSecondString() {
        // given
        let s = "badc", t = "baba"
        
        // when
        let result = solution.isIsomorphic(s, t)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isIsomorphicEfficient_ReturnsTrueWhenStringsAreIsomorphicAndHaveRepeatedCharacters() {
        // given
        let s = "egg", t = "add"

        // when
        let result = solution.isIsomorphic(s, t)

        // then
        XCTAssertTrue(result)
    }
    
    func test_isIsomorphicEfficient_ReturnsFalseWhenStringsAreNotIsomorphic() {
        // given
        let s = "foo", t = "bar"
        
        // when
        let result = solution.isIsomorphic(s, t)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isIsomorphicEfficient_ReturnsTrueWhenStringsAreIsomorphic() {
        // given
        let s = "paper", t = "title"

        // when
        let result = solution.isIsomorphic(s, t)

        // then
        XCTAssertTrue(result)
    }
    
    func test_isIsomorphicEfficient_ReturnsFalseWhenGivenTwoNonIsomorphicStringsWithRepeatedCharactersInSecondString() {
        // given
        let s = "badc", t = "baba"
        
        // when
        let result = solution.isIsomorphic(s, t)
        
        // then
        XCTAssertFalse(result)
    }
}

SolutionTests.defaultTestSuite.run()
