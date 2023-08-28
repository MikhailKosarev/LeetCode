/**
 118. Pascal's Triangle
 https://leetcode.com/problems/pascals-triangle/
 Easy

 Given an integer numRows, return the first numRows of Pascal's triangle.
 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

 Example 1:
 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 
 Example 2:
 Input: numRows = 1
 Output: [[1]]

 Constraints:
 1 <= numRows <= 30
 */

import XCTest

class Solution {
    // time complexity `O(n^2)` where `n` is the number of rows.
    // space complexity `O(1)`, we don't use extra space.
    func generate(_ numRows: Int) -> [[Int]] {
        var result = Array(repeating: [Int](), count: numRows)
        result[0] = [1]
        
        for row in 1..<numRows {
            result[row] = Array(repeating: 1, count: row + 1)
            
            for element in 1..<row {
                result[row][element] = result[row - 1][element - 1] + result[row - 1][element]
            }
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_generate_returnsExpectedValueWhenGivenBigNumberOfRows() {
        // given
        let numRows = 5
        let expectedValue = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
        
        // when
        let actualValue = solution.generate(numRows)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_generate_returnsExpectedValueWhenNumberOfRowsIsOne() {
        // given
        let numRows = 1
        let expectedValue = [[1]]
        
        // when
        let actualValue = solution.generate(numRows)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
}

SolutionTests.defaultTestSuite.run()
