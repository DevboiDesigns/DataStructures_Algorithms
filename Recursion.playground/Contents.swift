import UIKit

//MARK: Recursion/ Recursive - the process in which a function calls itself directly or indirectly

// Base case - ends recursion
// Recursive case - calls recursively

// less lines of code


func factorial(number: Int) -> Int {
    // base case
    if number == 0 {
        return 1
    }
    // recursive case
    return number * factorial(number: number - 1)
}


//let result = factorial(number: 5)
//print(result)


//MARK: Power
//2^3 = 2 * 2 * 2 = 8 (2 to the power of 3)

func power(number: Int, pow: Int) -> Int {
    // base case
    if pow == 0 {
        return 1
    }
    // recursive case
    return number * power(number: number, pow: pow - 1)
}

let result = power(number: 2, pow: 3)
print(result)
