//
//  Dijkstra.swift
//  Dijkstra
//
//  Created by joe on 8/23/14.
//  Copyright (c) 2014 Joseph Liccini. All rights reserved.
//

import Foundation

func solve(var edges: [[Int]], inout vertexA: Vertex, inout vertexB: Vertex) {

    var minDistances: [Int] = [Int](count: edges.count, repeatedValue: Int.max)
    var queue = PriorityQueue<Vertex>()
        
    /* Perform Dijsktra's Algorithm */
    queue.push(0, item: vertexA)
    
    while queue.count > 0
    {
        var state = queue.pop()
        var priority = state.priority
        var currentVertex = state.item
        
        if currentVertex == vertexB
        {
            println(priority)
            return
        }
        
        for v in currentVertex.neighbors
        {
            var minDistance = edges[v.id][currentVertex.id] + priority
            if minDistance < minDistances[v.id]
            {
                queue.push(minDistance, item: v)
                minDistances[v.id] = minDistance
            }
        }
    }
    println("NO")
}
