/*
 https://leetcode.com/problems/reshape-the-matrix/
 566. Reshape the Matrix
 Easy

 In MATLAB, there is a handy function called reshape which can reshape an m x n matrix into a new one with a different size r x c keeping its original data.
 You are given an m x n matrix mat and two integers r and c representing the number of rows and the number of columns of the wanted reshaped matrix.
 The reshaped matrix should be filled with all the elements of the original matrix in the same row-traversing order as they were.
 If the reshape operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.

 Example 1:
 Input: mat = [[1,2],[3,4]], r = 1, c = 4
 Output: [[1,2,3,4]]
 
 Example 2:
 Input: mat = [[1,2],[3,4]], r = 2, c = 4
 Output: [[1,2],[3,4]]
  
 Constraints:
 m == mat.length
 n == mat[i].length
 1 <= m, n <= 100
 -1000 <= mat[i][j] <= 1000
 1 <= r, c <= 300
 */

class Solution {
    // straight solution
    // time complexity = O(2n)
    // space complexity = O(2)
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        // check if we can reshape the matrix, otherwise return original array
        guard mat.count * mat[0].count == r * c else { return mat }
        // create flat array of matrix
        var matFlattened = mat.flatMap { $0 }
        // define result array
        var result = [[Int]]()
        // iterate all the rows
        for row in 0..<r {
            // define new row array
            var row = [Int]()
            // iterate all the columns
            for column in 0..<c {
                // fill the row with elements
                row.append(matFlattened.removeFirst())
            }
            // append row to the result array
            result.append(row)
        }
        // return result array
        return result
    }
    
    
    // math approach solution
    // time complexity = O(2n)
    // space complexity = O(1)
    func matrixReshapeMath(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        // calculate count of elements
        let count = r * c
        // check if we can reshape the matrix, otherwise return original array
        guard mat.count * mat[0].count == count else { return mat }
        // create a result array on fill it with zeros
        var result = Array(repeating: Array(repeating: 0, count: c), count: r)
        // iterate all the elements
        for i in 0..<count {
            // use matrix[index / width][index % width] and fill the result array with current elements
            result[i / c][i % c] = mat[i / mat[0].count][i % mat[0].count]
        }
        // return result array
        return result
    }
}

let solution = Solution()
let mat = [[1,2],[3,4]], r = 1, c = 4
solution.matrixReshape(mat, r, c)
solution.matrixReshapeMath(mat, r, c)
