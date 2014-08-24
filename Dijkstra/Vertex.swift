//
//  Vertex.swift
//  Dijkstra
//
//  Created by joe on 8/23/14.
//  Copyright (c) 2014 Joseph Liccini. All rights reserved.
//

import Foundation

class Vertex: NSObject, Equatable {
    var id: Int 
    var neighbors: [Vertex] = []
    
    init (id: Int) {
        self.id = id
    }
    
    func addNeighbor(neighbor: Vertex)
    {
        if !contains(neighbors, neighbor)
        {
            self.neighbors.append(neighbor)
        }
    }
    
}

func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.id == rhs.id
}
