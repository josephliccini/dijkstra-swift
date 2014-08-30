//
//  main.swift
//  Dijkstra Implementation
//  See: http://www.spoj.com/problems/EZDIJKST for problem statement
//
//  Created by joe on 8/23/14.
//  Copyright (c) 2014 Joseph Liccini. All rights reserved.
//

import Foundation

func readln() -> String {
    var keyboard = NSFileHandle.fileHandleWithStandardInput()
    var inputData = keyboard.availableData
    var input = String(NSString(data: inputData, encoding: NSUTF8StringEncoding))
    return input.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func split(input: String) -> [String] {
    var arr = input.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    return arr
}

func readNumCases() -> Int {
    var input = readln()
    var cases = input.toInt()
    return cases!
}

func readPair() -> (Int, Int) {
    var input = readln()
    var arr = split(input)
    return (arr[0].toInt()!, arr[1].toInt()!)
}

func readGraph() -> (vertexA: Vertex, vertexB: Vertex, edgeWeight: Int) {
    var input = readln()
    var arr = split(input)
    var vertexA = Vertex(id: arr[0].toInt()!)
    var vertexB = Vertex(id: arr[1].toInt()!)
    var edgeWeight = arr[2].toInt()!
    return (vertexA, vertexB, edgeWeight)
}

/* Begin Program */
var testCases = readNumCases()

for _ in 1...testCases
{
    /* Input is of the format:
     * 3 2
     * indicating, 3 verticies, and 2 edges */
    var pair: (Int, Int) = readPair()
    var numVerticies = pair.0
    var numEdges = pair.1
    
    /* Vertex ids cannot be 0, so we need to make our Edge[][] a (v+1) x (v+1) size grid, where v is the number
     * of verticies in the input */
    var edges: [[Int]] = [[Int]](count: numVerticies+1, repeatedValue: [Int](count: numVerticies+1, repeatedValue: 0))
    var verticies: [Vertex] = [Vertex](count: numVerticies+1, repeatedValue: Vertex(id: 0))
    
    for _ in 1...numEdges
    {
        var conditions = readGraph()
        
        /* Create verticies and add neighbors */
        if !contains(verticies, conditions.vertexA)
        {
            verticies[conditions.vertexA.id] = conditions.vertexA
        }
        verticies[conditions.vertexA.id].addNeighbor(conditions.vertexB)
        
        if !contains(verticies, conditions.vertexB)
        {
            verticies[conditions.vertexB.id] = conditions.vertexB
        }
        verticies[conditions.vertexB.id].addNeighbor(conditions.vertexA)
        
        /* Set edge weights for those verticies */
        edges[conditions.vertexA.id][conditions.vertexB.id] = conditions.edgeWeight
        edges[conditions.vertexB.id][conditions.vertexA.id] = conditions.edgeWeight
    }
    
    pair = readPair()
    var goalVerticies = (verticies[pair.0], verticies[pair.1])
    
    Dijkstra.solve(edges, &goalVerticies.0, &goalVerticies.1)
}