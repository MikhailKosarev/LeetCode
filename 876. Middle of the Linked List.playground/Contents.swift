/*
876. Middle of the Linked List
Easy

Given the head of a singly linked list, return the middle node of the linked list.
If there are two middle nodes, return the second middle node.

Example 1:
1 -> 2 -> |3| -> 4 -> 5
Input: head = [1,2,3,4,5]
Output: [3,4,5]
Explanation: The middle node of the list is node 3.
 
Example 2:
1 -> 2 -> 3 -> |4| -> 5 -> 6
Input: head = [1,2,3,4,5,6]
Output: [4,5,6]
Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.

Constraints:

The number of nodes in the list is in the range [1, 100].
1 <= Node.val <= 100
 */


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    // simple slow solution
    // time complexity O(n), where n is the length of the given linked list
    func middleNode(_ head: ListNode?) -> ListNode? {
        // define middle and count variables
        var middle = 0, count = 0
        // set current node variable
        var current = head
        // count the length of the list
        while current != nil {
            count += 1
            current = current?.next
        }
        // calculate the middle
        middle = count / 2 + 1
        // set the current node as a head
        current = head
        // go to the middle node
        for _ in 1..<middle {
            current = current?.next
        }
        // return middle node
        return current
    }
    
    // fast solution with two pointers
    // time complexity O(n), where n is the length of the given linked list
    func middleNodeTwoPointers(_ head: ListNode?) -> ListNode? {
        // define middleNode and endNode variables
        var middleNode = head, endNode = head
        // check if the endNode is last
        while endNode?.next != nil {
            // move middleNode by one
            middleNode = middleNode?.next
            // move endNode by two
            endNode = endNode?.next?.next
        }
        // return middle node
        return middleNode
    }
}

// define nodes
let five = ListNode(5)
let four = ListNode(4, five)
let three = ListNode(3, four)
let two = ListNode(2, three)
let head = ListNode(1, two)
// solution
let solution = Solution()
solution.middleNode(head)
solution.middleNodeTwoPointers(head)
