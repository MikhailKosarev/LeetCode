/**
 1299. Replace Elements with Greatest Element on Right Side
 Easy
 
 https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/

 Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.

 After doing so, return the array.

 Example 1:
 Input: arr = [17,18,5,4,6,1]
 Output: [18,6,6,6,1,-1]
 Explanation:
 - index 0 --> the greatest element to the right of index 0 is index 1 (18).
 - index 1 --> the greatest element to the right of index 1 is index 4 (6).
 - index 2 --> the greatest element to the right of index 2 is index 4 (6).
 - index 3 --> the greatest element to the right of index 3 is index 4 (6).
 - index 4 --> the greatest element to the right of index 4 is index 5 (1).
 - index 5 --> there are no elements to the right of index 5, so we put -1.
 
 Example 2:
 Input: arr = [400]
 Output: [-1]
 Explanation: There are no elements to the right of index 0.

 Constraints:
 1 <= arr.length <= 104
 1 <= arr[i] <= 105
 */

/*
 thoughts:
 [17, 18, 5, 4, 6, 1]
 [-1, -1,-1,-1,-1,-1]
 1. max = 1
 [-1, -1,-1,-1, 1,-1]
 2. max = max(6, max)
 [-1, -1,-1, 6, 1,-1]
 
 */
import XCTest

class Solution {
    // NOTE: There can be a straight solution with brutforsing and time complexity `O(n^2)` where `n` is the lenght of the given array. But I didn't code it here as an inefficient.

    // time complexity `O(n)` where `n` is the lenght of the given array.
    // space complexity is `O(1)`.
    func replaceElements(_ arr: [Int]) -> [Int] {
        let arrCount = arr.count
        var resultArr = Array(repeating: -1, count: arrCount)
        
        var currentMax = -1
        
        for index in (0..<arrCount).reversed() {
            resultArr[index] = currentMax
            currentMax = max(currentMax, arr[index])
        }
        
        return resultArr
    }
}


class SolutionTests: XCTestCase {
    
    let solution = Solution()
    
    func test_replaceElementsReturnsExpectedValueWhenGivenArrayWithManyElements() {
        // given
        let arr = [17,18,5,4,6,1]
        let expectedValue = [18,6,6,6,1,-1]
        
        // when
        let actualValue = solution.replaceElements(arr)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func test_replaceElementsReturnsExpectedValueWhenGivenArrayWithOneElement() {
        // given
        let arr = [400]
        let expectedValue = [-1]
        
        // when
        let actualValue = solution.replaceElements(arr)
        
        // then
        XCTAssertEqual(expectedValue, actualValue)
    }
}

SolutionTests.defaultTestSuite.run()
