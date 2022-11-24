/*
 https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary/?envType=study-plan&id=programming-skills-i
 1491. Average Salary Excluding the Minimum and Maximum Salary
 Easy

 You are given an array of unique integers salary where salary[i] is the salary of the ith employee.
 Return the average salary of employees excluding the minimum and maximum salary. Answers within 10-5 of the actual answer will be accepted.

 Example 1:
 Input: salary = [4000,3000,1000,2000]
 Output: 2500.00000
 Explanation: Minimum salary and maximum salary are 1000 and 4000 respectively.
 Average salary excluding minimum and maximum salary is (2000+3000) / 2 = 2500
 
 Example 2:
 Input: salary = [1000,2000,3000]
 Output: 2000.00000
 Explanation: Minimum salary and maximum salary are 1000 and 3000 respectively.
 Average salary excluding minimum and maximum salary is (2000) / 1 = 2000
  
 Constraints:
 3 <= salary.length <= 100
 1000 <= salary[i] <= 106
 All the integers of salary are unique.
 */

class Solution {
    // solution without sorting, using high order function
    // time complexity O(n)
    func average(_ salary: [Int]) -> Double {
        // use "reduce" to get the total sum
        var total = Double(salary.reduce(0, { partialResult, current in
            // check if the current element is max or min. If true, exclude it from total sum
            if current == salary.max() || current == salary.min() {
                return partialResult
            }
            return partialResult + current
        }))
        // divide total sum by count of element excluding two (min and max)
        return total / Double(salary.count - 2)
    }
    
    // one liner solution with high order function
    // time complexity = O(n)
    func averageOneLiner(_ salary: [Int]) -> Double {
        Double(salary.reduce(0, +) - salary.min()! - salary.max()!) / Double(salary.count - 2)
    }
    
    // solution with high order function reduce(into:)
    // time complexity = O(n)
    func averageSmart(_ salary: [Int]) -> Double {
        let (minimum, maximum, total) = salary.reduce(into: (Int.max, 1000, 0)) {
            $0.0 = min($0.0, $1)
            $0.1 = max($0.1, $1)
            $0.2 += $1
        }
        return Double(total - minimum - maximum) / Double(salary.count - 2)
    }
    
    // solution with sorting
    // time complexity = O(n*logn*n) = O(n2 * logn)
    func averageSorting(_ salary: [Int]) -> Double {
        // create a mutable copy of the original array
        var sortSalary = salary.sorted()
        // delete min
        sortSalary.removeFirst()
        // delete max
        sortSalary.removeLast()
        // get the sum of elements
        let sum = sortSalary.reduce(0, +)
        // get the average
        let total = Double(sum) / Double(sortSalary.count)
        return total
    }
}


let solution = Solution()
let salary = [8000, 9000, 2000, 3000, 6000, 1000]
solution.average(salary)
solution.averageOneLiner(salary)
solution.averageSmart(salary)
solution.averageSorting(salary)
