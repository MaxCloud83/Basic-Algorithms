//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

//QuickSort, Partition-Exchange Sort

func quickSort(array:[Any]) -> [Any] {
    quickSortExec(left:0, right:array.count-1)
    return array
}

func quickSortExec(left: Int, right: Int) {
    var i, j, privot : Int
    if left > right {
        return
    }
    
    privot = numberArray[left]
    
    i = left
    j = right
    
    while i != j {
        while numberArray[j] >= privot && i<j {
            j -= 1
        }
        
        while numberArray[i] <= privot && i<j {
            i += 1
        }
        if i < j {
            swap(&numberArray[i], &numberArray[j])
        }
    }
    
    numberArray[left] = numberArray[i]
    numberArray[i] = privot
    
    //二分
    quickSortExec(left: left, right: i-1)
    quickSortExec(left: i+1, right: right)
}

var numberArray = [1, 4, 6, 5, 8, 2]
print(quickSort(array: numberArray))
