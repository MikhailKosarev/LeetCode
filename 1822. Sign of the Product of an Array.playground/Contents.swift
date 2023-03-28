/*
 https://leetcode.com/problems/sign-of-the-product-of-an-array/?envType=study-plan&id=programming-skills-i
 1822. Sign of the Product of an Array
 Easy

 There is a function signFunc(x) that returns:
 1 if x is positive.
 -1 if x is negative.
 0 if x is equal to 0.
 You are given an integer array nums. Let product be the product of all values in the array nums.

 Return signFunc(product).

 Example 1:
 Input: nums = [-1,-2,-3,-4,3,2,1]
 Output: 1
 Explanation: The product of all values in the array is 144, and signFunc(144) = 1
 
 Example 2:
 Input: nums = [1,5,0,2,-3]
 Output: 0
 Explanation: The product of all values in the array is 0, and signFunc(0) = 0
 
 Example 3:
 Input: nums = [-1,1,-1,1,-1]
 Output: -1
 Explanation: The product of all values in the array is -1, and signFunc(-1) = -1

 Constraints:
 1 <= nums.length <= 1000
 -100 <= nums[i] <= 100
 */

class Solution {
    
    // straight solution with overflow error
    // time complexity = O(n), where n is the length of the given array
    func arraySign(_ nums: [Int]) -> Int {
        let x = nums.reduce(1, *)
        return signFunc(x: x)
    }
    
    // time complexity = O(1)
    func signFunc(x: Int) -> Int {
        switch x {
        case let x where x > 0: return 1
        case let x where x < 0: return -1
        default: return 0
        }
    }
    
    // time complexity = O(n), where n is the length of the given array
    func arraySignFast(_ nums: [Int]) -> Int {
        // check if there is zero in the array and if it's true then return 0
        guard !nums.contains(0) else { return 0 }
        // filter negative elements to new array
        let negative = nums.filter { $0 < 0 }
        // if count of negative elements is odd than return -1, else return 1
        return negative.count % 2 != 0 ? -1 : 1
    }
    
    // elegant solution with high order function one line
    // time complexity = O(n), where n is the length of the given array
    func arraySignOneLiner(_ nums: [Int]) -> Int {
        // use reduce and signum to product the sign of element
        nums.reduce(1, { $0 * $1.signum() })
    }

    // time complexity = O(n), where n is the length of the given array
    func arraySignFastest(_ nums: [Int]) -> Int {
        // check if there is zero in the array and if it's true then return 0
        guard !nums.contains(0) else { return 0 }
        // use reduce and signum to product the sign of element
        return nums.reduce(1) { $0 * $1.signum() }
    }
}

let solution = Solution()
let nums = [-1,-2,-3,-4,3,2,1]
//solution.arraySign(nums)  // overflow error
solution.arraySignFast(nums)
solution.arraySignOneLiner(nums)
solution.arraySignFastest(nums)
