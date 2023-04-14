/*
 https://leetcode.com/problems/verifying-an-alien-dictionary/
 953. Verifying an Alien Dictionary
 Easy

 In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.

 Example 1:
 Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
 Output: true
 Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
 
 Example 2:
 Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 Output: false
 Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 
 Example 3:
 Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
 Output: false
 Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).

 Constraints:
 1 <= words.length <= 100
 1 <= words[i].length <= 20
 order.length == 26
 All characters in words[i] and order are English lowercase letters.
 */

class Solution {
    // time complexity = O(n * m), where n is the number of words and m is the length of the shorter word.
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count > 1 else { return true }
        
        // define a map for the alphabet
        var hashTable = [Character: Int]()
        // fill the hashTable for the alphabet
        for (index, char) in order.enumerated() {
            hashTable[char] = index
        }
        
        // iterate all the words
        for i in 0..<words.count - 1 {
            // just for convenience define two variables for current and next word
            let currentWord = words[i], nextWord = words[i + 1]
            // find minimum length of this two words
            let minLength = min(currentWord.count, nextWord.count)
            
            // iterate the letters in these two words
            for j in 0..<minLength {
                // just for convenience define two variables for current and next characters
                let currentChar = currentWord[currentWord.index(currentWord.startIndex, offsetBy: j)]
                let nextChar = nextWord[nextWord.index(nextWord.startIndex, offsetBy: j)]
                
                // check if we compare the last characters
                if (j == minLength - 1) && (currentChar == nextChar) {
                    // and if current word is longert than next, then immediately return false
                    if currentWord.count > nextWord.count {
                        return false
                    }
                }
                // check if characters are equal, then immediately go to the next circle
                guard currentChar != nextChar else { continue }
                
                // compare position of two chars if they are not equal
                // if current char is smaller then next the break the loop and start to compare next words
                if hashTable[currentChar]! < hashTable[nextChar]! {
                    break
                    // otherwise immediately return false
                } else {
                    return false
                }
            }
        }
        // return true if all conditions are true
        return true
    }
}

let solution = Solution()
let words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
solution.isAlienSorted(words, order)
