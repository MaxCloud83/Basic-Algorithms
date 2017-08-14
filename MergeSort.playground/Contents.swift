//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//MergeSort: 归并排序法

typealias CRITERIA<Int> = (Int, Int) -> Bool

func mergeSortOf(_ arr: [Int],
    byCriteria: @escaping (CRITERIA<Int>) = { $0 < $1 }) -> [Int] {
    
    guard arr.count > 1 else {
        return arr
    }

    func merge(_ arr: inout [Int], low: Int, mid: Int, high: Int, temp: inout [Int]) {
        var i = low
        var j = mid + 1
        let m = mid
        let n = high
        var k = 0
        
        while i <= m, j <= n {
            
            if byCriteria(arr[i], arr[j]) {
                temp[k] = arr[i]
                k += 1
                i += 1
            } else {
                temp[k] = arr[j]
                k += 1
                j += 1
            }
        }
        
        while i <= m {
            temp[k] = arr[i]
            k += 1
            i += 1
        }
        
        while j <=  n {
            temp[k] = arr[j]
            k += 1
            j += 1
        }
        
        for f in 0 ..< k {
            arr[low + f] = temp[f]
        }
    }
    
    func internalMergeSort(_ arr: inout [Int], low: Int, high: Int, temp: inout [Int]) {
        if high <= low {
            return
        }
        
        let mid = low + (high - low) / 2
        // 左边排序
        internalMergeSort(&arr, low: low, high: mid, temp: &temp)
        // 右边排序
        internalMergeSort(&arr, low: mid + 1, high: high, temp: &temp)
        // 将两边合起来
        merge(&arr, low: low, mid: mid, high: high, temp: &temp)
    }
    
    var array = arr
    var temp: [Int] = arr// 辅助数组
    internalMergeSort(&array, low: 0, high: arr.count - 1, temp: &temp)
    return array
}

var numbersArray = [10,3,17,8,5,2,1,9,5,4]
print("插入排序方案: \(mergeSortOf(numbersArray))")
print("插入排序方案: \(mergeSortOf(numbersArray, byCriteria: <))")
print("插入排序方案: \(mergeSortOf(numbersArray, byCriteria: >))")

