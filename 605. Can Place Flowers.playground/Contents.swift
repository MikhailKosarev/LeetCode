/**
 605. Can Place Flowers
 https://leetcode.com/problems/can-place-flowers/
 Easy

 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.
 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.

 Example 1:
 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 
 Example 2:
 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false

 Constraints:
 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length
 */

import XCTest

class Solution {
    // time complexity `O(n)`, where `n` is the lenght of the `flowerbed`.
    // space complexity `O(1)`, we don't use extra space.
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var count = 0
        var index = 0
        
        while index < flowerbed.count {
            if flowerbed[index] == 0,
               (index == 0 || flowerbed[index - 1] == 0),
               (index == flowerbed.count - 1 || flowerbed[index + 1] == 0) {
                count += 1
                index += 2
            } else {
                index += 1
            }
        }
        
        return count >= n
    }
    
    func canPlaceFlowersSecond(_ flowerbed: [Int], _ n: Int) -> Bool {
        var count = 0
        var index = 0
        // we need to guess that there is an element with `0` value at the beginning and at the end of the given array. We can do it using a condition at the beginning of the loop. And we don't use an extra array in this case.
        // time complexity `O(n)`, where `n` is the lenght of the `flowerbed`.
        // space complexity `O(1)`, we don't use extra space.
        while index < flowerbed.count {
            let previous = index == 0 ? 0 : flowerbed[index - 1]
            let next = index == flowerbed.count - 1 ? 0 : flowerbed[index + 1]
            let current = flowerbed[index]
            
            if current == 0, previous == 0, next == 0 {
                count += 1
                index += 2
            } else {
                index += 1
            }
        }
        
        return count >= n
    }
}

class SolutionTests: XCTestCase {
    let solution = Solution()
    
    func test_canPlaceFlowers_returnsTrueWhenNewFlowersCanBePlanted() {
        // given
        let flowerbed = [1,0,0,0,1], n = 1
        
        // when
        let result = solution.canPlaceFlowers(flowerbed, n)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_canPlaceFlowers_returnsFalseWhenNewFlowersCanNotBePlanted() {
        // given
        let flowerbed = [1,0,0,0,1], n = 2
        
        // when
        let result = solution.canPlaceFlowers(flowerbed, n)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_canPlaceFlowersSecond_returnsTrueWhenNewFlowersCanBePlanted() {
        // given
        let flowerbed = [1,0,0,0,1], n = 1
        
        // when
        let result = solution.canPlaceFlowersSecond(flowerbed, n)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_canPlaceFlowersSecond_returnsFalseWhenNewFlowersCanNotBePlanted() {
        // given
        let flowerbed = [1,0,0,0,1], n = 2
        
        // when
        let result = solution.canPlaceFlowersSecond(flowerbed, n)
        
        // then
        XCTAssertFalse(result)
    }
}

SolutionTests.defaultTestSuite.run()
