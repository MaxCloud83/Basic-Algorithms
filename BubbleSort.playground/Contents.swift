//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//QuickSort: 冒泡排序法

enum SortType {
    case ascending  //升序
    case descending //降序
}

func bubbleSort(_ data: inout [Int], type:SortType = .ascending) {
    for i in 0...(data.count - 2) { //n个数进行排序，只要进行（n - 1）轮操作
        for j in 0...(data.count - i - 2){ //开始一轮操作
            let flag = (type == .ascending) ? data[j] > data[j + 1] : data[j] < data[j + 1]
            if flag{ //交换位置
                let temp = data[j]
                data[j] = data[j + 1]
                data[j + 1] = temp
            }
        }
    }
}

var numbersArray = [10,3,17,8,5,2,1,9,5,4]
bubbleSort(&numbersArray)
print("冒泡排序方案: \(numbersArray)")

numbersArray = [10,3,17,8,5,2,1,9,5,4]
bubbleSort(&numbersArray, type: .ascending)
print("冒泡排序方案: \(numbersArray)")

numbersArray = [10,3,17,8,5,2,1,9,5,4]
bubbleSort(&numbersArray, type: .descending)
print("冒泡排序方案: \(numbersArray)")
