import UIKit
import Foundation

// MARK: Trees - connection of nodes
// Root - top level node
// Parent
// Child
// Leaf

class TreeNode<T> {
    
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
    
}

// requres generic type be of Equatable to use methods
extension TreeNode where T: Equatable {
    
    //--------------------------------------------------- Depth First Traversal
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self) // root - self
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    //--------------------------------------------------- Level Order Traversal
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
    
    //--------------------------------------------------- Search
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}


struct Queue<T> {
    var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    @discardableResult
    mutating func enqueue(_ value: T) -> Bool {
        elements.append(value)
        return true
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

// root
let beverages = TreeNode("Beverages")

let hot = TreeNode("1 Hot")
let cold = TreeNode("2 Cold")

let tea = TreeNode(" -Tea")
let coffee = TreeNode(" -Coffee")
hot.add(tea)
hot.add(coffee)

let soda = TreeNode(" -Soda")
let milk = TreeNode(" -Milk")
cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

/*
 
        Beverages
          / \
         /   \
        /     \
      hot     cold
      /\        /\
     /  \      /  \
   tea coffee soda milk
 
 
 
 Beverages
 1 Hot
  -Tea
  -Coffee
 2 Cold
  -Soda
  -Milk
 
 
 */


//MARK: Depth First Traversal
// root - left node - deeper into left node - back left node top - further into deeper left node - back to root - right node - deeper right node - etc


// beverages.forEachDepthFirst { print($0.value) }


//MARK: Level Order Traversal
// Beverages -> Hot -> Cold -> Tea -> Coffee -> Soda -> Milk -> etc


// beverages.forEachLevelOrder { print($0.value) }


//MARK: Search
// search for value in tree
if let result = beverages.search(" -Milk") {
    print(result.value)
}

