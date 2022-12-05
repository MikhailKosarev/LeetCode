/*
 https://leetcode.com/problems/sum-of-all-odd-length-subarrays/
 1588. Sum of All Odd Length Subarrays
 Easy

 Given an array of positive integers arr, return the sum of all possible odd-length subarrays of arr.
 A subarray is a contiguous subsequence of the array.

 Example 1:
 Input: arr = [1,4,2,5,3]
 Output: 58
 Explanation: The odd-length subarrays of arr and their sums are:
 [1] = 1
 [4] = 4
 [2] = 2
 [5] = 5
 [3] = 3
 [1,4,2] = 7
 [4,2,5] = 11
 [2,5,3] = 10
 [1,4,2,5,3] = 15
 If we add all these together we get 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58
 
 Example 2:
 Input: arr = [1,2]
 Output: 3
 Explanation: There are only 2 subarrays of odd length, [1] and [2]. Their sum is 3.
 
 Example 3:
 Input: arr = [10,11,12]
 Output: 66

 Constraints:
 1 <= arr.length <= 100
 1 <= arr[i] <= 1000
  
 Follow up:
 Could you solve this problem in O(n) time complexity?
 */
import Foundation

class Solution {
    
    // first wrong trying to solve the problem
    // it doesn't work with small arrays
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        guard arr.count > 2 else { return arr.reduce(0, +) }
        guard arr.count > 3 else { return arr.reduce(0) {$0 + $1 * 2} }
        var count = 0
        if arr.count % 2 == 0 {
            count = arr.count / 2
        } else {
            count = arr.count / 2 + 1
        }
        var pointer1 = 0
        var pointer2 = arr.count - 1
        var sum = 0
        while pointer1 < pointer2 {
            sum += (arr[pointer1] * count)
            sum += (arr[pointer2] * count)
            count += 1
            pointer1 += 1
            pointer2 -= 1
            print(sum)
        }
        sum += arr[pointer1] * (count)
        return sum
    }
    
    // fast solution, time complexity O(n)
    // explanation:
    // To get the answer, we just need to sum the contribution * number
    // To get the contribution of each number to odd length subarrays, we just need to divide it by 2
    // contribution = (i + 1) * (n - i) / 2
    func sumOddLengthSubarraysFast(_ arr: [Int]) -> Int {
        // define sum variable
        var sum = 0
        // iterate all elements of array
        for (index, number) in arr.enumerated() {
            // calculate a contribution of each number
            let contribution = ceil(0.5 * Double((index + 1) * (arr.count - index)))
            // add number multiplying by it's contribution to final sum
            sum += number * Int(contribution)
        }
        // return final sum
        return sum
    }
    
    // an example of slow solution with brutforcing all the elements in two loops
    // time complexity O(n2)
    func sumOddLengthSubarraysSlow(_ arr: [Int]) -> Int {
        // define sum variable
        var sum = 0
        // iterate all elements of array
        for i in 0..<arr.count {
            // then iterate all the elements right to the current
            for j in i..<arr.count {
                // check if it's odd subarray
                if (j - i) % 2 == 0 {
                    // add the sum of subarray elements to the final sum
                    sum += arr[i...j].reduce(0, +)
                }
            }
        }
        // return the final sum
        return sum
    }
    
}

let solution = Solution()
let arr = [1,4,2,5,3]
solution.sumOddLengthSubarrays(arr)
solution.sumOddLengthSubarraysFast(arr)
solution.sumOddLengthSubarraysSlow(arr)
