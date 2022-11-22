/*
 https://leetcode.com/problems/ransom-note/
 383. Ransom Note
 Easy
 Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
 Each letter in magazine can only be used once in ransomNote.

 Example 1:
 Input: ransomNote = "a", magazine = "b"
 Output: false
 
 Example 2:
 Input: ransomNote = "aa", magazine = "ab"
 Output: false
 
 Example 3:
 Input: ransomNote = "aa", magazine = "aab"
 Output: true
 
 Constraints:
 1 <= ransomNote.length, magazine.length <= 105
 ransomNote and magazine consist of lowercase English letters.
 */

class Solution {
    // solution with dictionary and high order functions
    // time complexity = O(n*m)
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        // check if we have enough letters in the magazine to fill the ransomeNote
        guard ransomNote.count <= magazine.count else { return false }
        // create a magazineDictionary
        var magazineDictionary = [Character: Int]()
        // fill the magazineDictionary increasing by "1" each letter
        // if there isn't the letter in dictionary yet, - provide default "0" and then increase
        magazine.forEach { letter in
            magazineDictionary[letter, default: 0] += 1
        }
        // iterate ransomeNote
        for char in ransomNote {
            // check if magazine contains enough numbers of letter from ransomeNote, otherwise return false
            guard let count = magazineDictionary[char], count > 0 else { return false }
            magazineDictionary[char]! -= 1
        }
        return true
    }

    // fast solution without dictionaries
    // time complexity O(n)
    func canConstructFast(_ ransomNote: String, _ magazine: String) -> Bool {
        // create a mutable copy of magazine
        var magazineCopy = magazine
        // iterate ransomeNote letters
        for letter in ransomNote {
            // if there isn't letter from ransomeNote in magazine then immediately return false
            guard let index = magazineCopy.firstIndex(of: letter) else { return false }
            // otherwise remove the letter from magazine and go on iterating
            magazineCopy.remove(at: index)
        }
        // if all the letters from ransomeNote are in the magazine, then return true
        return true
    }
}

let solution = Solution()
let ransomeNote = "aa"
let magazine  = "aab"
solution.canConstruct(ransomeNote, magazine)
solution.canConstructFast(ransomeNote, magazine)
