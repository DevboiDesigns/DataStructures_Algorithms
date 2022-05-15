import UIKit
import Foundation

//MARK: Binary Search Tree

class BinaryNode<Element> {
    
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

// to display tree when printing
extension BinaryNode: CustomStringConvertible {
    public var description: String {
           return diagram(for: self)
       }
       
       private func diagram(for node: BinaryNode?,
                            _ top: String = "",
                            _ root: String = "",
                            _ bottom: String = "") -> String {
           guard let node = node else {
               return root + "nil\n"
           }
           if node.leftChild == nil && node.rightChild == nil {
               return root + "\(node.value)\n"
           }
           return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
               + root + "\(node.value)\n"
               + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
       }
}


struct BinarySearchTree<Element: Comparable> {
    
    private(set) var root: BinaryNode<Element>?
    
    init() { }
    
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root = root else { return "Empty Tree" }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    // ------------|^|-------------------------------------------- Insert/ Create into Binary Tree
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else { return BinaryNode(value) }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
    
    // ----------------------------------------------------------- Search the Binary Tree
    func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    // ----------------------------------------------------------- Remove an item from the Binary Tree
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else { return nil }
        
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}


var bst = BinarySearchTree<Int>()

// Binary Search Tree
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

print(bst)

/*
 
 ┌──5
┌──4
│ └──nil
3
│ ┌──2
└──1
 └──0
 
 
 */

print(bst.contains(5)) // true
print(bst.contains(99)) // false

bst.remove(5)
print(bst)

/*
 
 ┌──4
 3
 │ ┌──2
 └──1
  └──0
 
 
 */




