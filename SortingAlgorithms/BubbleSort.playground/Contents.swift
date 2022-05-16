import UIKit

//MARK: Bubble Sort

var numbers = [2,6,7,19,11,45,99,23,56,78,9]

print("------Before-----")
print(numbers)

for i in 0..<numbers.count {
    for j in 0..<numbers.count {
        if(numbers[i] > numbers[j]) {
            // swap the numbers
            numbers.swapAt(i, j)
        }
    }
}

print("\n")
print("------After-----")
print(numbers)
