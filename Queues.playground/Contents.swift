import Foundation

struct Queue<T> {
    
    var array: [T] = []
    init() { }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    // Gives item at top of queue
    var peek: T? {
        return array.first
    }
    
    // Add item to queue
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    // Remove from queue
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}


var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(2)
queue.enqueue(34)
queue.enqueue(55)

print(queue)

queue.dequeue()

print(queue)
