//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//SelectionSort: 选择排序法

typealias CRITERIA<T> = (T, T) -> Bool

func selectionSortOf<T: Comparable>(
    _ arr: Array<T>,
    byCriteria: CRITERIA<T> = { $0 < $1 }) -> Array<T> {
    
    // 1. An array with a single element is ordered
    guard arr.count > 1 else {
        return arr
    }
    
    var result = arr
    
    for i in 0 ..< result.count - 1 {
        var min = i
        for j in i+1 ..< result.count {
            if byCriteria(result[j], result[min]) {
                min = j
            }
        }
        let temp = result[min]
        result[min] = result[i]
        result[i] = temp
    }
    
    return result
}


var numbersArray = [10,3,17,8,5,2,1,9,5,4]
print("选择排序方案: \(selectionSortOf(numbersArray))")
print("选择排序方案: \(selectionSortOf(numbersArray, byCriteria: <))")
print("选择排序方案: \(selectionSortOf(numbersArray, byCriteria: >))")
