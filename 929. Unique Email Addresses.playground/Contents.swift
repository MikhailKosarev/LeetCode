/**
 929. Unique Email Addresses
 Easy
 https://leetcode.com/problems/unique-email-addresses/
 
 Every valid email consists of a local name and a domain name, separated by the '@' sign. Besides lowercase letters, the email may contain one or more '.' or '+'.

 For example, in "alice@leetcode.com", "alice" is the local name, and "leetcode.com" is the domain name.
 If you add periods '.' between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name. Note that this rule does not apply to domain names.

 For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.
 If you add a plus '+' in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered. Note that this rule does not apply to domain names.

 For example, "m.y+name@email.com" will be forwarded to "my@email.com".
 It is possible to use both of these rules at the same time.

 Given an array of strings emails where we send one email to each emails[i], return the number of different addresses that actually receive mails.

 Example 1:
 Input: emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
 Output: 2
 Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails.
 
 Example 2:
 Input: emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
 Output: 3
  
 Constraints:
 1 <= emails.length <= 100
 1 <= emails[i].length <= 100
 emails[i] consist of lowercase English letters, '+', '.' and '@'.
 Each emails[i] contains exactly one '@' character.
 All local and domain names are non-empty.
 Local names do not start with a '+' character.
 Domain names end with the ".com" suffix.
 */
import XCTest

class Solution {
    // time complexity `O(n*m)`, where `n` is the length of the given array and `m` is the length of the longest email in the array.
    // space complexity: `O(n)`, where `n` is the length of the given array.
    func numUniqueEmails(_ emails: [String]) -> Int {
        var uniqueEmails = Set<String>()
        
        for email in emails {
            let emailSeparatedByAtSign = email.split(separator: "@")
            let localName = emailSeparatedByAtSign[0]
            let domain = emailSeparatedByAtSign[1]
            
            let localNameBeforePlusSign = localName.split(separator: "+")[0]

            let localNameWithoutDots = localNameBeforePlusSign.filter { $0 != "."}
            let filteredEmail = localNameWithoutDots + "@" + domain
            uniqueEmails.insert(filteredEmail)
        }
        
        return uniqueEmails.count
    }
}

class SolutuionTests: XCTestCase {
    let solution = Solution()
    
    func test_numUniqueEmails_returnsExpectedResultWhenGivenArrayWithRepeatingEmails() {
        // given
        let emails = ["test.email+alex@leetcode.com","test.email.leet+alex@code.com"]
        let expectedResult = 2
        
        // when
        let actualResult = solution.numUniqueEmails(emails)
        
        // then
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_numUniqueEmails_returnsExpectedResultWhenGivenArrayWithOnlyUniqueEmails() {
        // given
        let emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
        let expectedResult = 3
        
        // when
        let actualResult = solution.numUniqueEmails(emails)
        
        // then
        XCTAssertEqual(expectedResult, actualResult)
    }
}

SolutuionTests.defaultTestSuite.run()
