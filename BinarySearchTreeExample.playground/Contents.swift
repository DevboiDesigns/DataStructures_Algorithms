import UIKit

let numbers = [1,5,15,17,19,22,24,31,105,150] // sorted array - required to work for binary search

var lowerBound = 0
var upperBound = numbers.count - 1
var middle = 0
var isFound = false
let valueToSearch = 111 // <------------------------------ value searching for - example

//MARK: Binary Search Algorithm
while(lowerBound <= upperBound) {
    
    // find the middle of array
    middle = (lowerBound + upperBound) / 2
    
    if(numbers[middle] == valueToSearch) {
        isFound = true
        break
    } else if(numbers[middle] < valueToSearch) {
        lowerBound = middle + 1
    } else {
        upperBound = middle - 1
    }
}

//print(isFound)

extension Array where Iterator.Element == Int {
    
    //MARK: Binary Search ext.
    func contains(_ value: Int) -> Bool {
        var lowerBound = 0
        var upperBound = self.count - 1
        var middle = 0
        var isFound = false

        while(lowerBound <= upperBound) {
            middle = (lowerBound + upperBound) / 2
            
            if(numbers[middle] == value) {
                isFound = true
                break
            } else if(numbers[middle] < value) {
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }
        }
        return isFound
    }
}


print(numbers.contains(31))
