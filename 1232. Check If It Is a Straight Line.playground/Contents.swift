/*
 https://leetcode.com/problems/check-if-it-is-a-straight-line/?envType=study-plan&id=programming-skills-i
 1232. Check If It Is a Straight Line
 Easy

 Share
 You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.

 Example 1:
 Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
 Output: true
 
 Example 2:
 Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
 Output: false
  
 Constraints:
 2 <= coordinates.length <= 1000
 coordinates[i].length == 2
 -10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
 coordinates contains no duplicate point.
 */

import Foundation

class Solution {
    // simple solution with using Equation of a Straight Line
    // let change division into multiplication (x3 - x1) / (x2 - x1) == (y3 - y1) / (y2 - y1) =>
    // (x2 - x1) * (y3 - y1) == (x3 - x1) * (y2 - y1)
    // time complexity = O(n), where n is the length of coordinates array
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        // check if we have only two points
        guard coordinates.count > 2 else { return true }
        // define convenient names for coordinates
        let x1 = coordinates[0][0]
        let y1 = coordinates[0][1]
        let x2 = coordinates[1][0]
        let y2 = coordinates[1][1]
        // iterate through all the coordinates
        for i in 2..<coordinates.count {
            // define convenient names
            let x3 = coordinates[i][0]
            let y3 = coordinates[i][1]
            // check if it's belong to a line, then when go to check the next coordinate, else immediately return false
            guard (x2 - x1) * (y3 - y1) == (x3 - x1) * (y2 - y1) else { return false }
        }
        // if all coordinates belong to a line, then return true
        return true
    }
    
    // solution as previous but a little shorter and faster
    // time complexity = O(n), where n is the length of coordinates array
    func checkStraightLineShorter(_ coordinates: [[Int]]) -> Bool {
        // check if we have only two points
        guard coordinates.count > 2 else { return true }
        // define convenient names for coordinates
        let x1 = coordinates[0][0]
        let y1 = coordinates[0][1]
        let x2 = coordinates[1][0]
        let y2 = coordinates[1][1]
        let dx = x2 - x1
        let dy = y2 - y1
        // iterate through all the coordinates
        for i in 2..<coordinates.count {
            // define convenient names
            let x3 = coordinates[i][0]
            let y3 = coordinates[i][1]
            // check if it's belong to a line, then when go to check the next coordinate, else immediately return false
            guard dx * (y3 - y1) == dy * (x3 - x1) else { return false }
        }
        // if all coordinates belong to a line, then return true
        return true
    }
    
    // Solution with collinear points (doesn't work on all cases)
    // If the area of triangle formed by three points is zero, then they are said to be collinear.
    // For example on this doesn't work: //let coordinates = [[0,0],[0,1],[0,-1]]
    func checkStraightLineCollinear(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count > 2 else { return true }
        let x1 = coordinates[0][0]
        let y1 = coordinates[0][1]
        let x2 = coordinates[1][0]
        let y2 = coordinates[1][1]
        for i in 2..<coordinates.count {
            let x3 = coordinates[i][0]
            let y3 = coordinates[i][1]
            if abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) / 2 == 0 {
                continue
            } else {
                return false
            }
        }
        return true
    }
}

let solution = Solution()
//let coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
let coordinates = [[0,0],[0,1],[0,-1]]
solution.checkStraightLine(coordinates)
solution.checkStraightLineShorter(coordinates)
solution.checkStraightLineCollinear(coordinates)
