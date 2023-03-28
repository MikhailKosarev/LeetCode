/*
 https://leetcode.com/problems/find-nearest-point-that-has-the-same-x-or-y-coordinate/?envType=study-plan&id=programming-skills-i
 1779. Find Nearest Point That Has the Same X or Y Coordinate
 Easy

 You are given two integers, x and y, which represent your current location on a Cartesian grid: (x, y). You are also given an array points where each points[i] = [ai, bi] represents that a point exists at (ai, bi). A point is valid if it shares the same x-coordinate or the same y-coordinate as your location.

 Return the index (0-indexed) of the valid point with the smallest Manhattan distance from your current location. If there are multiple, return the valid point with the smallest index. If there are no valid points, return -1.

 The Manhattan distance between two points (x1, y1) and (x2, y2) is abs(x1 - x2) + abs(y1 - y2).

 Example 1:
 Input: x = 3, y = 4, points = [[1,2],[3,1],[2,4],[2,3],[4,4]]
 Output: 2
 Explanation: Of all the points, only [3,1], [2,4] and [4,4] are valid. Of the valid points, [2,4] and [4,4] have the smallest Manhattan distance from your current location, with a distance of 1. [2,4] has the smallest index, so return 2.
 
 Example 2:
 Input: x = 3, y = 4, points = [[3,4]]
 Output: 0
 Explanation: The answer is allowed to be on the same location as your current location.
 
 Example 3:
 Input: x = 3, y = 4, points = [[2,3]]
 Output: -1
 Explanation: There are no valid points.

 Constraints:
 1 <= points.length <= 104
 points[i].length == 2
 1 <= x, y, ai, bi <= 104
 */


import Foundation

class Solution {
    // slow solution with high order function
    // time complexity O(n), where n is the length of the points
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        // define new array of valid points
        var validPoints = [[Int]]()
        // fill the array of valid points
        points.map {
            if $0[0] == x || $0[1] == y {
                validPoints.append($0)
            }
        }
        // check if we have valid points, else return -1
        guard !validPoints.isEmpty else { return -1 }
        // set the smallest index as a first element of valid points array
        var smallestIndex = points.firstIndex(of: validPoints.first!)!
        // set the smallest distance as a distance of first point
        var smallestDistance = abs(validPoints[0][0] - x) + abs(validPoints[0][1] - y)
        // check all the valid points with for loop
        for value in validPoints {
            // calculate current distance
            let currentDistance = abs(value[0] - x) + abs(value[1] - y)
            // check if it's the smallest distance
            if currentDistance < smallestDistance {
                // set the smallest distance as current
                smallestDistance = currentDistance
                // set the smallest index as the index of current point in points array
                smallestIndex = points.firstIndex(of: value)!
            }
        }
        // return the smallest index
        return smallestIndex
    }
    
    // simple fast solution
    // time complexity O(n), where n is the length of the points
    func nearestValidPointFast(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        // set smallest index as "-1" (for case if there are no valid points) and the smallest distance as a max Int value
        var smallestIndex = -1, smallestDistance = Int.max
        // check every point with for loop and "where" condition of validaty
        for (index, value) in points.enumerated() where value[0] == x || value[1] == y {
            // calculate the current distance
            let currentDistance = abs(value[0] - x) + abs(value[1] - y)
            // check if it's the smallest distance
            if currentDistance < smallestDistance {
                // set the smallest distance as current
                smallestDistance = currentDistance
                // set the smallest index as the index of current point in points array
                smallestIndex = index
            }
        }
        // return the smallest index
        return smallestIndex
    }
}

let x = 2
let y = 2
let points = [[5,4],[3,4],[1,3],[3,2],[1,7],[4,2]]
let solution = Solution()
print(points)
solution.nearestValidPoint(x, y, points)
solution.nearestValidPointFast(x, y, points)
