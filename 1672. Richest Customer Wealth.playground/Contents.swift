/*
 https://leetcode.com/problems/richest-customer-wealth/
 1672. Richest Customer Wealth
 Easy

 You are given an m x n integer grid accounts where accounts[i][j] is the amount of money the i​​​​​​​​​​​th​​​​ customer has in the j​​​​​​​​​​​th​​​​ bank. Return the wealth that the richest customer has.

 A customer's wealth is the amount of money they have in all their bank accounts. The richest customer is the customer that has the maximum wealth.

 Example 1:

 Input: accounts = [[1,2,3],[3,2,1]]
 Output: 6
 Explanation:
 1st customer has wealth = 1 + 2 + 3 = 6
 2nd customer has wealth = 3 + 2 + 1 = 6
 Both customers are considered the richest with a wealth of 6 each, so return 6.
 
 Example 2:

 Input: accounts = [[1,5],[7,3],[3,5]]
 Output: 10
 Explanation:
 1st customer has wealth = 6
 2nd customer has wealth = 10
 3rd customer has wealth = 8
 The 2nd customer is the richest with a wealth of 10.
 
 Example 3:

 Input: accounts = [[2,8,7],[7,1,3],[1,9,5]]
 Output: 17
  
 Constraints:

 m == accounts.length
 n == accounts[i].length
 1 <= m, n <= 50
 1 <= accounts[i][j] <= 100
 */

// first solution without high order functions
// time complexity O(n * m), where n is the number of customers and m is the max number of accounts for one customer
class Solution {
    // first solution without high order functions
    // time complexity O(n x m)
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        // define maximum wealth variable
        var maxWealth = 0
        // interate each customer
        for customer in accounts {
            // define current wealth of customer
            var customerWealth = 0
            // interate each bank account of current customer
            for bankAccount in customer {
                // calculate wealth of current customer
                customerWealth += bankAccount
            }
            // check if current customer is the reachest
            maxWealth = max(maxWealth, customerWealth)
        }
        // return maximum wealth
        return maxWealth
    }
    
    // second solution with high order functions
    // time complexity O(n x m)
    func maximumWealthHighOrder(_ accounts: [[Int]]) -> Int {
        // define maximum wealth variable
        var maxWealth = 0
        // interate each customer with "map" function
        accounts.map { customer in
            // calculate wealth of current customer with "reduce" function
            let customerWealth = customer.reduce(0) { result, bankAccount in
                // calculate wealth of current customer
                return result + bankAccount
            }
            // check if current customer is the reachest
            maxWealth = max(maxWealth, customerWealth)
        }
        // return maximum wealth
        return maxWealth
    }
}

let solution = Solution()
let input = [[7, 1, 3], [2, 8, 7], [1, 9, 5]]
solution.maximumWealth(input)
solution.maximumWealthHighOrder(input)
