/*
 https://leetcode.com/problems/merge-strings-alternately/
 1768. Merge Strings Alternately
 Easy
 
 You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1. If a string is longer than the other, append the additional letters onto the end of the merged string.
 Return the merged string.
 
 Example 1:
 Input: word1 = "abc", word2 = "pqr"
 Output: "apbqcr"
 Explanation: The merged string will be merged as so:
 word1:  a   b   c
 word2:    p   q   r
 merged: a p b q c r
 
 Example 2:
 Input: word1 = "ab", word2 = "pqrs"
 Output: "apbqrs"
 Explanation: Notice that as word2 is longer, "rs" is appended to the end.
 word1:  a   b
 word2:    p   q   r   s
 merged: a p b q   r   s
 
 Example 3:
 Input: word1 = "abcd", word2 = "pq"
 Output: "apbqcd"
 Explanation: Notice that as word1 is longer, "cd" is appended to the end.
 word1:  a   b   c   d
 word2:    p   q
 merged: a p b q c   d
 
 Constraints:
 1 <= word1.length, word2.length <= 100
 word1 and word2 consist of lowercase English letters.
 */


class Solution {
    // first straight solution
    // time complexity O(n+m), where n - is the lenght of word1 and m - is the length of word2
    // space complexity = O(n+m), where n - is the lenght of word1 and m - is the length of word2
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        // create an empty result array of chars
        var result = [Character]()
        // convert string to arrays
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        // create a count variable for minimum string
        var min = min(word1Array.count, word2Array.count)
        // create a count variable for maximum string
        var max = max(word1Array.count, word2Array.count)
        // iterate all the elements in two words before the length of the minimum word
        for index in 0..<min {
            // add letter to result array from word1
            result.append(word1Array[index])
            // then add letter to result array from word2
            result.append(word2Array[index])
        }
        // check if word1 is longer than word2
        if word1Array.count > word2Array.count {
            // then in loop add rest of word from word1 to result array
            for index in min..<max {
                result.append(word1Array[index])
            }
        } else {
            // otherwise in loop add rest of word from word2 to result array
            for index in min..<max {
                result.append(word2Array[index])
            }
        }
        // return result array as a String
        return String(result)
    }
    
    // second shorter solution with while loop
    // time complexity O(n+m), where n - is the lenght of word1 and m - is the length of word2
    // space complexity = O(n+m), where n - is the lenght of word1 and m - is the length of word2
    func mergeAlternatelyImproved(_ word1: String, _ word2: String) -> String {
        // create an empty result array of chars
        var result = ""
        // convert string to arrays
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        // define an iterator
        var i = 0
        // iterate both array for the length of max
        while i < max(word1Array.count, word2Array.count) {
            // check if there is a letter by the index
            if i < word1Array.count {
                // add the letter to the result string
                result += String(word1Array[i])
            }
            // check if there is a letter by the index
            if i < word2Array.count {
                // add the letter to the result string
                result += String(word2Array[i])
            }
            // increment the iterator
            i += 1
        }
        // return result string
        return result
    }
}

let solution = Solution()
let word1 = "abcd", word2 = "pq"
solution.mergeAlternately(word1, word2)
solution.mergeAlternately(word1, word2)
