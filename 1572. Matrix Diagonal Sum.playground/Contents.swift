/*
 https://leetcode.com/problems/matrix-diagonal-sum/
 1572. Matrix Diagonal Sum
 Easy

 Given a square matrix mat, return the sum of the matrix diagonals.
 Only include the sum of all the elements on the primary diagonal and all the elements on the secondary diagonal that are not part of the primary diagonal.

 Example 1:
 Input: mat = [[1,2,3],
               [4,5,6],
               [7,8,9]]
 Output: 25
 Explanation: Diagonals sum: 1 + 5 + 9 + 3 + 7 = 25
 Notice that element mat[1][1] = 5 is counted only once.
 
 Example 2:
 Input: mat = [[1,1,1,1],
               [1,1,1,1],
               [1,1,1,1],
               [1,1,1,1]]
 Output: 8
 
 Example 3:
 Input: mat = [[5]]
 Output: 5
  
 Constraints:
 n == mat.length == mat[i].length
 1 <= n <= 100
 1 <= mat[i][j] <= 100
 */

class Solution {
    // straight solution
    // time complexity = O(n), where n is the number of elements in the matrix
    // space complexity = O(1)
    func diagonalSum(_ mat: [[Int]]) -> Int {
        // define sum variable
        var sum = 0
        // define pointers
        var pointer1 = 0, pointer2 = mat.count - 1
        // iterate all rows in the matrix
        for row in mat {
            // if pointers are equal then calculate them just once
            if pointer1 == pointer2 {
                sum += row[pointer1]
            // otherwise calculate two times
            } else {
                sum += (row[pointer1] + row[pointer2])
            }
            // increment first pointer
            pointer1 += 1
            // decrement second pointer
            pointer2 -= 1
        }
        // return sum
        return sum
    }
}

let solution = Solution()
let mat = [[1,2,3],
           [4,5,6],
           [7,8,9]]
solution.diagonalSum(mat)

