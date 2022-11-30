/*
 https://leetcode.com/problems/can-make-arithmetic-progression-from-sequence/?envType=study-plan&id=programming-skills-i
 1502. Can Make Arithmetic Progression From Sequence
 Easy

 A sequence of numbers is called an arithmetic progression if the difference between any two consecutive elements is the same.
 Given an array of numbers arr, return true if the array can be rearranged to form an arithmetic progression. Otherwise, return false.

 Example 1:
 Input: arr = [3,5,1]
 Output: true
 Explanation: We can reorder the elements as [1,3,5] or [5,3,1] with differences 2 and -2 respectively, between each consecutive elements.
 
 Example 2:
 Input: arr = [1,2,4]
 Output: false
 Explanation: There is no way to reorder the elements to obtain an arithmetic progression.

 Constraints:
 2 <= arr.length <= 1000
 -106 <= arr[i] <= 106
 */

import Foundation

class Solution {
    // simple and the fastest solution with sorting and looping all the elements
    // time complexity O(n*logn)
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        // create a sorted copy of input array
        let sortedArr = arr.sorted()
        // define a difference between two first elements
        let difference = sortedArr[0] - sortedArr[1]
        // check difference of all elements in the loop. If it's not equal, then return false
        for index in 1..<sortedArr.count - 1 {
            if sortedArr[index] - sortedArr[index + 1] != difference {
                return false
            }
        }
        // otherwise return true
        return true
    }
}
let solution = Solution()
let arr = [1,2,4]
solution.canMakeArithmeticProgression(arr)
