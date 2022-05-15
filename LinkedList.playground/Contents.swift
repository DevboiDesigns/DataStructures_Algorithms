import Foundation

struct LinkedList<Value> {
    
    init() { }
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    //Push - appends to head of list
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    //Append - appends to tail of list
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail?.next = node
        tail = node
    }
    
    // Find index of particular node
    func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    //Insert - appends to particular position
    func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
    
    //Pop - remove item from list at head (returns popped value)
    mutating func pop() -> Value? {
        defer {
           // will run after returning head - defer runs last
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    //Remove last -
    mutating func removeLast() -> Value? {
        guard let head = head else { return nil }
        guard head.next != nil else { return pop() }
        
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        previous.next = nil
        tail = previous
        return current.value
        
    }
    
    // Remove after - a particular item
    mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

//Extension to make print statements clean
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

//Node Class
class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}


//Extension to make print statements clean
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

//let node1 = Node(value: 1)
//let node2 = Node(value: 2)
//let node3 = Node(value: 3)
//
//node1.next = node2
//node2.next = node3
//print(node1)


var list = LinkedList<Int>()
//list.push(2)
//list.push(3)
//list.push(22)
list.append(20)
list.append(3)
list.append(12)
list.append(100)

//let middleNode = list.node(at: 1)!
//list.insert(999, after: middleNode)
//
//print(list)

//print("Before")
//print(list)
//
//print("After")
//list.pop()
//print(list)

//print("Before")
//print(list)
//
//print("After")
//list.removeLast()
//print(list)

print("Before")
print(list)
print("After")
let index = 1
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)
print(list)
