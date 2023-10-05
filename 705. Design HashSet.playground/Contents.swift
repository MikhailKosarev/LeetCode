/*
 705. Design HashSet
 Easy
 https://leetcode.com/problems/design-hashset/
 
 Design a HashSet without using any built-in hash table libraries.

 Implement MyHashSet class:
 void add(key) Inserts the value key into the HashSet.
 bool contains(key) Returns whether the value key exists in the HashSet or not.
 void remove(key) Removes the value key in the HashSet. If key does not exist in the HashSet, do nothing.

 Example 1:
 Input
 ["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
 [[], [1], [2], [1], [3], [2], [2], [2], [2]]
 Output
 [null, null, null, true, false, null, true, null, false]

 Explanation
 MyHashSet myHashSet = new MyHashSet();
 myHashSet.add(1);      // set = [1]
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(1); // return True
 myHashSet.contains(3); // return False, (not found)
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(2); // return True
 myHashSet.remove(2);   // set = [1]
 myHashSet.contains(2); // return False, (already removed)

 Constraints:
 0 <= key <= 10^6
 At most 10^4 calls will be made to add, remove, and contains.
 */
import XCTest

/// Straight-forward solution.
/// - Complexity: Time complexity for all operations: `O(n)` where `n` is the number of keys in the HashSet.
/// Time complexity for `init`: `O(1)`.
/// Memory complexity of class: `O(n)` where `n` is the number of keys in the HashSet.
class MyHashSetStraight {
    
    private var keys = [Int]()
    
    init() {}
    
    /// Inserts the value `key` into the HashSet.
    /// - Parameter key: Value key to insert.
    /// - Complexity: `O(n)` where `n` is the number of keys in the HashSet.
    func add(_ key: Int) {
        if !keys.contains(key) {
            keys.append(key)
        }
    }
    
    /// Removes the value `key` in the HashSet. If `key` does not exist in the HashSet, do nothing.
    /// - Parameter key: Value key to remove.
    /// - Complexity: `O(n)` where `n` is the number of keys in the HashSet.
    func remove(_ key: Int) {
        keys.removeAll { $0 == key }
    }
    
    /// Returns whether the value `key` exists in the HashSet or not.
    /// - Parameter key: Value key to check.
    /// - Complexity: `O(n)` where `n` is the number of keys in the HashSet.
    func contains(_ key: Int) -> Bool {
        keys.contains(key)
    }
}

/// Solution based on the length constraints of the hashSet.
/// - Complexity: Time complexity for `init`: `O(n)` where `n` is the maximum number of keys in the HashSet.
/// Time complexity for all operations: `O(1)`.
/// Memory complexity of class: `O(n)` where `n` is the maximum number of keys in the HashSet.
class MyHashSetEfficient {
    
    private var keys = [Bool]()
    private let lengthOfSet = 1_000_001
    
    /// Initializes the Set.
    /// - Complexity: `O(n)` where `n` is the maximum number of keys in the HashSet.
    init() {
        keys = Array(repeating: false, count: lengthOfSet)
    }
    
    /// Inserts the value `key` into the HashSet.
    /// - Parameter key: Value key to insert.
    func add(_ key: Int) {
        keys[key] = true
    }
    
    /// Removes the value `key` in the HashSet. If `key` does not exist in the HashSet, do nothing.
    /// - Parameter key: Value key to remove.
    func remove(_ key: Int) {
        keys[key] = false
    }
    
    /// Returns whether the value `key` exists in the HashSet or not.
    /// - Parameter key: Value key to check.
    func contains(_ key: Int) -> Bool {
        keys[key]
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */

class MyHashSetStraightTests: XCTestCase {
    
    override func setUp() {
        myHashSet = MyHashSetStraight()
    }
    
    func test_add_AddsKeyWhenGivenOneKey() {
        // given
        let keyToAdd = 1
        
        // when
        myHashSet.add(keyToAdd)
        let myHashSetContaintsKey = myHashSet.contains(keyToAdd)
        
        // then
        XCTAssertTrue(myHashSetContaintsKey)
    }
    
    func test_add_AddsKeysWhenGivenTwoKeysInARow() {
        // given
        let firstKeyToAdd = 1
        let secondKeyToAdd = 2
        
        // when
        myHashSet.add(firstKeyToAdd)
        myHashSet.add(secondKeyToAdd)
        let myHashSetContaintsFirstKey = myHashSet.contains(firstKeyToAdd)
        let myHashSetContaintsSecondKey = myHashSet.contains(secondKeyToAdd)
        
        // then
        XCTAssertTrue(myHashSetContaintsFirstKey)
        XCTAssertTrue(myHashSetContaintsSecondKey)
    }
    
    func test_add_AddsKeyWhenItIsAlreadyInTheHashSet() {
        // given
        let keyToAdd = 2
        
        // when
        myHashSet.add(keyToAdd)
        myHashSet.add(keyToAdd)
        let myHashSetContaintsKey = myHashSet.contains(keyToAdd)
        
        // then
        XCTAssertTrue(myHashSetContaintsKey)
    }
    
    func test_contains_ReturnsFalseWhenHashSetDoesNotContainGivenKey() {
        // given
        let notContainedKey = 3
        
        // when
        let myHashSetContaintsKey = myHashSet.contains(notContainedKey)
        
        // then
        XCTAssertFalse(myHashSetContaintsKey)
    }
    
    func test_remove_RemovesGivenKeyFromHashSet() {
        // given
        let keyToRemove = 2
        
        // when
        myHashSet.add(keyToRemove)
        myHashSet.remove(keyToRemove)
        let myHashSetContaintsKey = myHashSet.contains(keyToRemove)
        
        // then
        XCTAssertFalse(myHashSetContaintsKey)
    }
    
    private var myHashSet = MyHashSetStraight()
}

class MyHashSetEfficientTests: XCTestCase {
    
    override func setUp() {
        myHashSet = MyHashSetEfficient()
    }
    
    func test_add_AddsKeyWhenGivenOneKey() {
        // given
        let keyToAdd = 1
        
        // when
        myHashSet.add(keyToAdd)
        let myHashSetContaintsKey = myHashSet.contains(keyToAdd)
        
        // then
        XCTAssertTrue(myHashSetContaintsKey)
    }
    
    func test_add_AddsKeysWhenGivenTwoKeysInARow() {
        // given
        let firstKeyToAdd = 1
        let secondKeyToAdd = 2
        
        // when
        myHashSet.add(firstKeyToAdd)
        myHashSet.add(secondKeyToAdd)
        let myHashSetContaintsFirstKey = myHashSet.contains(firstKeyToAdd)
        let myHashSetContaintsSecondKey = myHashSet.contains(secondKeyToAdd)
        
        // then
        XCTAssertTrue(myHashSetContaintsFirstKey)
        XCTAssertTrue(myHashSetContaintsSecondKey)
    }
    
    func test_add_AddsKeyWhenItIsAlreadyInTheHashSet() {
        // given
        let keyToAdd = 2
        
        // when
        myHashSet.add(keyToAdd)
        myHashSet.add(keyToAdd)
        let myHashSetContaintsKey = myHashSet.contains(keyToAdd)
        
        // then
        XCTAssertTrue(myHashSetContaintsKey)
    }
    
    func test_contains_ReturnsFalseWhenHashSetDoesNotContainGivenKey() {
        // given
        let notContainedKey = 3
        
        // when
        let myHashSetContaintsKey = myHashSet.contains(notContainedKey)
        
        // then
        XCTAssertFalse(myHashSetContaintsKey)
    }
    
    func test_remove_RemovesGivenKeyFromHashSet() {
        // given
        let keyToRemove = 2
        
        // when
        myHashSet.add(keyToRemove)
        myHashSet.remove(keyToRemove)
        let myHashSetContaintsKey = myHashSet.contains(keyToRemove)
        
        // then
        XCTAssertFalse(myHashSetContaintsKey)
    }
    
    private var myHashSet = MyHashSetEfficient()
}

MyHashSetStraightTests.defaultTestSuite.run()
MyHashSetEfficientTests.defaultTestSuite.run()
