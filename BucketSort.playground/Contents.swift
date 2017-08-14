//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//BucketSort: 桶排序法

enum SortType {
    case ascending  //升序
    case descending //降序
}

func bucketSortOf(_ arr: [Int], type:SortType = .ascending) -> [Int] {
    
    guard arr.count > 1 else {
        return arr
    }
    
    let maxNum = arr.max()
    //桶的数目
    var bucket:[Int] = Array.init(repeatElement(0, count: maxNum! + 1))
    var newNum:[Int] = Array.init()
    //给桶加标记
    for index in arr {
        let numId = index
        bucket[numId] += 1
    }
    
    for index in bucket.indices {
        _ = (type == .ascending) ? index : bucket.count - index
        while bucket[index] > 0 {
            newNum.append(index)
            bucket[index] -= 1
        }
    }
    return newNum
}

var numbersArray = [10,3,17,8,5,2,1,9,5,4]
print("桶排序方案: \(bucketSortOf(numbersArray))")
print("桶排序方案: \(bucketSortOf(numbersArray,type: .ascending))")
print("桶排序方案: \(bucketSortOf(numbersArray,type: .descending))")
