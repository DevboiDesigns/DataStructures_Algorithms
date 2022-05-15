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

//------------------------------------- Depth First Traversal
extension TreeNode {
    
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self) // root - self
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
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
 
 */


//MARK: Depth First Traversal
// root - left node - deeper into left node - back left node top - further into deeper left node - back to root - right node - deeper right node - etc


beverages.forEachDepthFirst { print($0.value) }
