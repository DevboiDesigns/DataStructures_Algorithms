import UIKit
import Foundation

//MARK: Graphs - vertices connected by edges
// * vertices
// - edges


//MARK: -------------------------------------------- Vertex & Edge Models

enum EdgeType {
    case directed
    case undirected
}

struct Vertex<T> {
    let data: T
    let index: Int
}

extension Vertex: Hashable where T: Hashable { }
extension Vertex: Equatable where T: Equatable { }

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(index): \(data)"
    }
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double? // Price for example
}

//MARK: --------------------------------------- Adjaceny List

protocol Graph {
    associatedtype Element
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    
    // Add undirected graph
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    // Add func
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
    
}

class AdjacenyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>:[Edge<T>]] = [:]
    init() { }
    
    //  Create Vertex
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, index: adjacencies.count)
        adjacencies[vertex] = []
        return vertex
    }
    
    // Add directed edge
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    // Edges
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    // Weight
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).first { $0.destination == destination }?.weight
    }
    
}

// to print graph to see it
extension AdjacenyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                edgeString.append("\(edge.destination), ")
            } else {
                edgeString.append("\(edge.destination)")
            }
        }
        result.append("\(vertex) ---> [ \(edgeString) ]\n")
    }
    return result
    }
}


var graph = AdjacenyList<String>()

let singapore = graph.createVertex(data: "Singapore")
let tokyo = graph.createVertex(data: "Tokyo")
let hongKong = graph.createVertex(data: "Hong Kong")
let detroit = graph.createVertex(data: "Detroit")
let sanFrancisco = graph.createVertex(data: "San Francisco")
let washingtonDC = graph.createVertex(data: "Washington DC")
let austin = graph.createVertex(data: "Austin")
let seattle = graph.createVertex(data: "Seattle")

graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
graph.add(.undirected, from: singapore, to: tokyo, weight: 300)
graph.add(.undirected, from: hongKong, to: tokyo, weight: 300)
graph.add(.undirected, from: tokyo, to: detroit, weight: 300)
graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 300)
graph.add(.undirected, from: detroit, to: austin, weight: 300)
graph.add(.undirected, from: austin, to: washingtonDC, weight: 300)
graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 300)
graph.add(.undirected, from: washingtonDC, to: seattle, weight: 300)
graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 300)
graph.add(.undirected, from: austin, to: sanFrancisco, weight: 300)


print(graph)
