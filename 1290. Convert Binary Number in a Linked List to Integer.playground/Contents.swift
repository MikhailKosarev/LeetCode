/*
 https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/
 1290. Convert Binary Number in a Linked List to Integer
 Easy

 Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.
 Return the decimal value of the number in the linked list.
 The most significant bit is at the head of the linked list.

 Example 1:
 Input: head = [1,0,1]
 Output: 5
 Explanation: (101) in base 2 = (5) in base 10
 
 Example 2:
 Input: head = [0]
 Output: 0

 Constraints:
 The Linked List is not empty.
 Number of nodes will not exceed 30.
 Each node's value is either 0 or 1.
 */


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    // straight solution with String converting
    // time complexity O(n), where n is the length of Linked List
    func getDecimalValue(_ head: ListNode?) -> Int {
        // set current node as a head
        var current: ListNode? = head
        // define an empty String for binary result
        var binaryString = ""
        // iterate the linked list
        while current != nil {
            // append the current value to the end of the string
            binaryString.append(String(current!.val))
            // set the current node as a next one
            current = current?.next
        }
        // convert a string with binary number to the decimal Int number and return as a result
        return Int(String(binaryString), radix: 2)!
    }
    
    // solution with bitwise operators
    // time complexity O(n), where n is the length of Linked List
    func getDecimalValueFast(_ head: ListNode?) -> Int {
        // define result variable and set )
        var result: Int = 0
        // set current node as a head
        var current: ListNode? = head
        // iterate the linked list
        while current != nil {
            // calculate result with bitwise operators
            result = (result << 1) | current!.val
            // set the current node as a next one
            current = current!.next
        }
        // return the result
        return result
    }
    
    // elegant simple solution
    // time complexity O(n), where n is the length of Linked List
    func getDecimalValueOneMore(_ head: ListNode?) -> Int {
        // define result variable and set )
        var result: Int = 0
        // set current node as a head
        var current: ListNode? = head
        // iterate the linked list
        while current != nil {
            // calculate the current result multiplying the current number by 2 (because of binary system)
            result *= 2
            // add the current value to the current result
            result += current!.val
            // set the current node as a next one
            current = current!.next
        }
        // return the result
        return result
    }
}

let thirdNode = ListNode(1)
let secondNode = ListNode(0, thirdNode)
let firstNode = ListNode(1, secondNode)

let solution = Solution()
let head = firstNode
solution.getDecimalValue(head)
solution.getDecimalValueFast(head)
solution.getDecimalValueOneMore(head)
