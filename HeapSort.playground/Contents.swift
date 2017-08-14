//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//HeapSort: 堆排序法

typealias CRITERIA<Int> = (Int, Int) -> Bool

func heapSortOf(_ arr: [Int],
                 byCriteria: @escaping (CRITERIA<Int>) = { $0 < $1 }) -> [Int] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    var result = arr
    
    func heapify(_ arr: inout [Int], i: Int, heapsize: Int) {
        var smallest = i
        let left = 2 * i + 1
        let right = 2 * i + 2
        
        if left < heapsize {
            if byCriteria(arr[i], arr[left]) {
                smallest = left
            } else {
                smallest = i
            }
        }
        
        if right < heapsize {
            if byCriteria(arr[smallest], arr[right]) {
                smallest = right
            }
        }
        
        if smallest != i {
            let temp: Int = arr[i]
            arr[i] = arr[smallest]
            arr[smallest] = temp
            heapify(&arr, i: smallest, heapsize: heapsize)
        }
    }
    
    func buildheap(_ arr: inout [Int]) {
        let length = arr.count
        let heapsize = length
        var nonleaf = length/2 - 1
        while nonleaf >= 0 {
            heapify(&arr, i: nonleaf, heapsize: heapsize)
            nonleaf -= 1
        }
    }
    
    func internalHeapSort(_ arr: inout [Int]) {
        var heapsize = arr.count
        buildheap(&arr)
        for _ in 0 ..< (arr.count - 1) {
            let temp: Int = arr[0]
            arr[0] = arr[heapsize - 1]
            arr[heapsize - 1] = temp
            heapsize = heapsize - 1
            heapify(&arr, i: 0, heapsize: heapsize)
        }
    }
    internalHeapSort(&result)
    return result
}

var numbersArray = [10,3,17,8,5,2,1,9,5,4]
print("堆排序方案: \(heapSortOf(numbersArray))")
print("堆排序方案: \(heapSortOf(numbersArray, byCriteria: <))")
print("堆排序方案: \(heapSortOf(numbersArray, byCriteria: >))")
