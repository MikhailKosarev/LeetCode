/**
 706. Design HashMap
 Easy
 https://leetcode.com/problems/design-hashmap/

 Design a HashMap without using any built-in hash table libraries.

 Implement the MyHashMap class:
 MyHashMap() initializes the object with an empty map.
 void put(int key, int value) inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
 int get(int key) returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
 void remove(key) removes the key and its corresponding value if the map contains the mapping for the key.

 Example 1:
 Input
 ["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
 [[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
 
 Output
 [null, null, null, 1, -1, null, 1, null, -1]
 
 Explanation
 MyHashMap myHashMap = new MyHashMap();
 myHashMap.put(1, 1); // The map is now [[1,1]]
 myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
 myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
 myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
 myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
 myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
 myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
 myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]

 Constraints:
 0 <= key, value <= 106
 At most 104 calls will be made to put, get, and remove.
 */
import XCTest

/// Simple colution based on the task's constraints.
///  - Complexity: Time complexity for `init`: `O(n)` where `n` is the maximum number of keys in the HashMap.
/// Time complexity for all operations: `O(1)`.
/// Memory complexity of class: `O(n)` where `n` is the maximum number of keys in the HashMap.
class MyHashMap {
    
    private var hashMap = [Int]()

    /// Initializes the hashMap.
    /// - Complexity: `O(n)` where `n` is the maximum number of keys in the HashSet.
    init() {
        hashMap = Array(repeating: -1, count: 1_000_001)
    }
    
    /// Inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
    /// - Parameters:
    ///   - key: `key` from the (key, value) pair.
    ///   - value: `value` from the (key, value) pair.
    func put(_ key: Int, _ value: Int) {
        hashMap[key] = value
    }
    
    /// Returns the value to which the specified key is mapped.
    /// - Parameter key: `key` from the (key, value) pair.
    /// - Returns: The value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
    func get(_ key: Int) -> Int {
        hashMap[key]
    }
    
    /// Removes the key and its corresponding value if the map contains the mapping for the key.
    /// - Parameter key: `key` from the (key, value) pair.
    func remove(_ key: Int) {
        hashMap[key] = -1
    }
}

class MyHashMapTests: XCTestCase {
    
    override func setUp() {
        myHashMap = MyHashMap()
    }
    
    func test_put_PutsTheValueToTheAccordingKeyWhenGivenOneValue() {
        // given
        let key = 1
        let value = 1
        
        // when
        myHashMap.put(key, value)
        let actualValue = myHashMap.get(key)
        
        // then
        XCTAssertEqual(value, actualValue)
    }
    
    func test_put_PutsTheValueToTheAccordingKeyWhenGivenTwoValuesInARow() {
        // given
        let key1 = 1
        let value1 = 1
        let key2 = 2
        let value2 = 2
        
        // when
        myHashMap.put(key1, value1)
        myHashMap.put(key2, value2)
        let actualValue1 = myHashMap.get(key1)
        let actualValue2 = myHashMap.get(key2)
        
        // then
        XCTAssertEqual(value1, actualValue1)
        XCTAssertEqual(value2, actualValue2)
    }
    
    func test_put_PutsUpdatesTheValueWhenGivenExistingKey() {
        // given
        let key = 1
        let value1 = 1
        let value2 = 2
        
        // when
        myHashMap.put(key, value1)
        myHashMap.put(key, value2)
        let actualValue = myHashMap.get(key)
        
        // then
        XCTAssertEqual(value2, actualValue)
    }
    
    func test_get_ReturnsTheValueForTheExistingKey() {
        // given
        let key = 1
        let value = 1
        
        // when
        myHashMap.put(key, value)
        let actualValue = myHashMap.get(key)
        
        // then
        XCTAssertEqual(value, actualValue)
    }
    
    func test_get_ReturnsMinusOneForTheNotExistingKey() {
        // given
        let key = 1
        let expectedResult = -1
        
        // when
        let actualResult = myHashMap.get(key)
        
        // then
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func test_remove_RemovesValueForTheKey() {
        // given
        let key = 1
        let value = 1
        let expectedResult = -1
        
        // when
        myHashMap.put(key, value)
        myHashMap.remove(key)
        let actualResult = myHashMap.get(key)
        
        // then
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    private var myHashMap = MyHashMap()
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
MyHashMapTests.defaultTestSuite.run()
