import UIKit

//MARK: Selection Sorting
// find the minimum element, swap with current index - iterate though each index and swap with min element

var numbers = [2,6,7,19,11,45,99,23,56,78,9]

print("-----Before-----")
print(numbers)

var minimumIndex = 0

for i in 0..<numbers.count {
    minimumIndex = i
    for j in (i+1)..<numbers.count {
        
        if (numbers[j] < numbers[minimumIndex]) {
            numbers.swapAt(minimumIndex, j)
        }
    }
}

print("-----After-----")
print(numbers)
