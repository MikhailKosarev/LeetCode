/*
 https://leetcode.com/problems/valid-anagram/
 242. Valid Anagram
 Easy

 Given two strings s and t, return true if t is an anagram of s, and false otherwise.
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false
  
 Constraints:
 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.

 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 */

class Solution {
    // straight way with hash table
    // time complexity = O(n+m), where n is the lentgh of `s` and m is the length of `t`
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // first check if the lengths are equal else immediately return false
        guard s.count == t.count else { return false }
        
        // define an empty hash table for the first word
        var hashTable = [Character: Int]()
        // fill the hash table of the first word
        for char in s {
            hashTable[char, default: 0] += 1
        }
        
        // iterate the second word
        for char in t {
            // check if have have the same letter in the hash table and if the count of these letters is more than 0
            if hashTable[char] != nil && hashTable[char]! > 0 {
                // decrement the count of this letter in the hash table
                hashTable[char]! -= 1
            } else {
                // otherwise immediately return false
                return false
            }
        }
        
        // if all the letters from "t" are in the "s" and their count is equal then return true
        return true
        
    }
    
    // straight way with hash table using high order functions
    // time complexity = O(n+m), where n is the lentgh of `s` and m is the length of `t`
    func isAnagramHigh(_ s: String, _ t: String) -> Bool {
        // first check if the lengths are equal else immediately return false
        guard s.count == t.count else { return false }
        
        // define an empty hash table for the first word
        var hashTable = [Character: Int]()
        // fill the hash table of the first word
        s.forEach { hashTable[$0, default: 0] += 1 }
        
        // iterate the second word
        for char in t {
            // check if have have the same letter in the hash table and if the count of these letters is more than 0
            if hashTable[char] != nil && hashTable[char]! > 0 {
                // decrement the count of this letter in the hash table
                hashTable[char]! -= 1
            } else {
                // otherwise immediately return false
                return false
            }
        }
        
        // if all the letters from "t" are in the "s" and their count is equal then return true
        return true
        
    }
    
    
    // short solution but without early return
    // time complexity = O(n+m), where n is the lentgh of `s` and m is the length of `t`
    func isAnagramOneLiner(_ s: String, _ t: String) -> Bool {
        Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +) == Dictionary(t.map { ($0, 1) }, uniquingKeysWith: +)
    }
}
let solution = Solution()
let s = "anagram", t = "nagaram"
solution.isAnagram(s, t)
solution.isAnagramHigh(s, t)
