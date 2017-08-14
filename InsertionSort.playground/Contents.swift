//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//QuickSort: 插入排序法

enum SortType {
    case ascending  //升序
    case descending //降序
}

typealias CRITERIA<T> = (T, T) -> Bool

func insertionSortOf<T: Comparable>(
    _ coll: Array<T>,
    byCriteria: CRITERIA<T> = { $0 < $1 }) -> Array<T> {
    
    // 1. An array with a single element is ordered
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    
    for x in 1 ..< coll.count {
        var y = x
        let key = result[y]
        
        //print("Get: \(key)")
        
        // 2. If the key needs to swap in the previous ordered sub array
        while y > 0 && byCriteria(key, result[y - 1]) {
            //print("-----------------------------")
            //print("Remove: \(result[y]) at pos: \(y)")
            //print("Insert: \(key) at pos: \(y - 1)")
            //print("-----------------------------")
            
            // 3. Swap the value
            // The new Swift 3 API:
            // remove(at:) replaces removeAtIndex
            // You can also use swap(:) instead of remove and insert.
            result.remove(at: y)
            result.insert(key, at: y - 1)
            y -= 1 
        }
    }
    // 4. Return the sorted array
    return result
}


var numbersArray = [10,3,17,8,5,2,1,9,5,4]
print("插入排序方案: \(insertionSortOf(numbersArray))")
print("插入排序方案: \(insertionSortOf(numbersArray, byCriteria: <))")
print("插入排序方案: \(insertionSortOf(numbersArray, byCriteria: >))")
print("插入排序方案: \(numbersArray)")
