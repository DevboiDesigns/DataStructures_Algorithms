import UIKit

//MARK: Insertion Sort

var numbers = [12,34,66,9,99,2,1,5,6]

print("----Before-----")
print(numbers)

for i in 0..<numbers.count {
    
    let key = numbers[i]
    var j = i - 1
    
    while(j >= 0 && numbers[j] > key) {
        
        numbers[j+1] = numbers[j]
        j = j - 1
    }
    
    numbers[j + 1] = key
}


print("----After-----")
print(numbers)
