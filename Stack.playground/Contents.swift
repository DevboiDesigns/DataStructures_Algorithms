import Foundation

//MARK: Stack
// LIFO - Last In First Out

struct Stack<Element> {
    
    private var storage: [Element] = []
    
    init() {}
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

// Display/ print purpose - nothing else
extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "--------top----------\n"
        let bottomDivider = "\n------bottom--------"
        
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var stack = Stack<Int>()   // use to store Int type
stack.push(20)
stack.push(10)
stack.push(3)
stack.push(99)

print("Before")
print(stack)
print("After")
stack.pop()
print(stack)
