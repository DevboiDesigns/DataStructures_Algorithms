import UIKit

// MARK: Binary Tree
// every node can only have 2 child nodes / 2 leaves

class BinaryNode<Element> {
    
    var value: Element
    var leftChild: BinaryNode? // 1 node
    var rightChild: BinaryNode? // 2 node
    
    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    //------------------------------------------------ In Order Traversal
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    //------------------------------------------------ Post Order Traversal
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    //------------------------------------------------ Pre Order Traversal
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
        
    }
}




let ten = BinaryNode(10)
let nine = BinaryNode(9)
let two = BinaryNode(2)
let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)

// Binary Tree Structure
ten.leftChild = nine
ten.rightChild = two
nine.leftChild = one
nine.rightChild = three
two.leftChild = four
two.rightChild = six

ten.traverseInOrder {
    print($0)
}

/*
------- prints
 1
 9
 3
 10
 4
 2
 6
 
 */

ten.traversePostOrder {
    print($0)
}

/*
------- prints
 1
 3
 9
 4
 6
 2
 10
 
 */

ten.traversePreOrder {
    print($0)
}

/*
------- prints
 10
 9
 1
 3
 2
 4
 6
 
 */
