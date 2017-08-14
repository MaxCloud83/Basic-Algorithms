//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//QuickSort, Partition-Exchange Sort : 快速排序法

//辅助空间
func quickSort(_ data:[Int]) -> [Int] {
    if data.count <= 1 {
        return data
    }
    
    var left: [Int] = []
    var right: [Int] = []
    let pivot:Int = data[data.count-1]
    for index in 0..<data.count-1 {
        if data[index] < pivot {
            left.append(data[index])
        }else{
            right.append(data[index])
        }
    }
    
    var result = quickSort(left)
    result.append(pivot)
    let rightResult = quickSort(right)
    result.append(contentsOf: rightResult)
    return result
}

var numberArray = [10,3,17,8,5,2,1,9,5,4]
print("辅助空间方案: \(quickSort(numberArray))")

//经典快排
func partition(_ data: inout [Int], low:Int, high:Int) -> Int {
    let root = data[high]
    var index = low
    for i in low...high {
        if data[i] < root {
            if i != index {
                swap(&data[i], &data[index])
            }
            index = index+1
        }
    }
    
    if high != index {
        swap(&data[high], &data[index])
    }
    return index
}

func quickSort2(_ data: inout [Int], low:Int, high:Int) {
    if low>high {
        return
    }
    let sortIndex = partition(&data, low: low, high: high)
    quickSort2(&data, low: low, high: sortIndex-1)
    quickSort2(&data, low: sortIndex+1, high: high)
}

numberArray = [10,3,17,8,5,2,1,9,5,4]
quickSort2(&numberArray, low: 0, high: numberArray.count-1)
print("经典快排方案: \(numberArray)")

