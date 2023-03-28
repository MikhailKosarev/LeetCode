/*
 https://leetcode.com/problems/next-greater-element-i/?envType=study-plan&id=programming-skills-i
 496. Next Greater Element I
 Easy

 The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.
 You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.
 For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.
 Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

 Example 1:
 Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
 Output: [-1,3,-1]
 Explanation: The next greater element for each value of nums1 is as follows:
 - 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
 - 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
 - 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
 
 Example 2:
 Input: nums1 = [2,4], nums2 = [1,2,3,4]
 Output: [3,-1]
 Explanation: The next greater element for each value of nums1 is as follows:
 - 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
 - 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.
  
 Constraints:
 1 <= nums1.length <= nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 104
 All integers in nums1 and nums2 are unique.
 All the integers of nums1 also appear in nums2.
  
 Follow up: Could you find an O(nums1.length + nums2.length) solution?
 */

class Solution {
    
    // first solution with for loop
    // time complexity O(n * m), where n is the length of nums1 and m is the length of nums2
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // define result array
        var result = [Int]()
        // iterate all the elements of nums1
        for valueNums1 in nums1 {
            // get the index of element from nums1 in nums2
            let j = nums2.firstIndex(of: valueNums1)!
            // set the result value as -1
            var resultValue = -1
            // iterate all the elements right the valueNums1 in nums2
            for index in (j + 1)..<nums2.count {
                // check if the current element in nums2 greater than in nums1
                if nums2[index] > valueNums1 {
                    // if true, then set it as a result value
                    resultValue = nums2[index]
                    // and break the loop
                    break
                }
            }
            // append result value to the result array
            result.append(resultValue)
        }
        // return result array
        return result
    }
    
    // the same solution but wirh high order function
    // time complexity O(n * m), where n is the length of nums1 and m is the length of nums2
    func nextGreaterElement2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // define result array
        var result = [Int]()
        // iterate all the elements of nums1
        nums1.forEach { valueNums1 in
            // get the index of element from nums1 in nums2
            let j = nums2.firstIndex(of: valueNums1)!
            // set the result value as -1
            var resultValue = -1
            // iterate all the elements right the valueNums1 in nums2
            for index in (j + 1)..<nums2.count {
                // check if the current element in nums2 greater than in nums1
                if nums2[index] > valueNums1 {
                    // if true, then set it as a result value
                    resultValue = nums2[index]
                    // and break the loop
                    break
                }
            }
            // append result value to the result array
            result.append(resultValue)
        }
        // return result array
        return result
    }
    
    // solution with hash map
    // time complexity O(n + m), where n is the length of nums1 and m is the length of nums2
    func nextGreaterElementMap(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // define hash map for [element: next greater element]
        var hashMap = [Int: Int]()
        // define empty stack
        var stack = [Int]()
        // iterate all the elements in nums2
        for num in nums2 {
            // check if the current element greater than elements in stack
            while !stack.isEmpty && stack.last! < num {
                // if true, than add this pair to the hash map as [element: next greater element]
                hashMap[stack.removeLast()] = num
            }
            // append next element of nums2 to the stack
            stack.append(num)
        }
        // return result array of "value" for "key" in hash map or -1
        return nums1.map { hashMap[$0] ?? -1 }
    }
}

let solution = Solution()
let nums1 = [4,1,2], nums2 = [1,3,4,2]
solution.nextGreaterElement(nums1, nums2)
solution.nextGreaterElement2(nums1, nums2)
solution.nextGreaterElementMap(nums1, nums2)
