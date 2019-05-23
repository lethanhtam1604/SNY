//
//  main.swift
//  Test
//
//  Created by Thanh-Tam Le on 16/05/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import Foundation

struct Queue<Element> {
    
    private var array: [Element] = []
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    mutating func enqueue(_ element: Element) {
        array.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        }
        return array.removeFirst()
    }
    
    public var front: Element? {
        return array.first
    }
    
    public var back: Element? {
        return array.last
    }
}

let MAX = 1000
var graph   : [[Int]] = Array(repeating: [], count: MAX)
var path    : [Int]   = Array(repeating: -1, count: MAX)
var visited : [Bool]  = Array(repeating: false, count: MAX)

func BFS(s: Int, V: Int, E: Int) {
    for i in 1...V {
        visited[i] = false
        path[i] = -1
    }
    var queue = Queue<Int>()
    visited[s] = true
    queue.enqueue(s)
    while !queue.isEmpty {
        let vertice = queue.dequeue() ?? 0
        for v in graph[vertice] {
            if !visited[v] {
                visited[v] = true
                queue.enqueue(v)
                path[v] = vertice
            }
        }
    }
}

func printResult(_ s: Int, _ f: Int, _ back: [Int]) -> Int {
    var res = 0, d = f
    while (true) {
        d = back[d];
        res += 6
        if(d == s) {
            break
        }
        if (d == -1) {
            res = -1
            break
        }
    }
    return res
}


let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!
guard var q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }
while q > 0 {
    q -= 1
    guard let nmC_libC_roadTemp = readLine() else { fatalError("Bad input") }
    let nmC_libC_road = nmC_libC_roadTemp.split(separator: " ").map{ String($0) }
    guard let n = Int(nmC_libC_road[0].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    guard let m = Int(nmC_libC_road[1].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    let edges : [[Int]] = AnyIterator{ readLine() }.prefix(m).map {
        let edgesRow: [Int] = $0.split(separator: " ").map {
            if let edgesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
                return edgesItem
            } else { fatalError("Bad input") }
        }
        guard edgesRow.count == 2 else { fatalError("Bad input") }
        return edgesRow
    }
    guard edges.count == m else { fatalError("Bad input") }
    for item in edges {
        graph[item[0]].append(item[1])
        graph[item[1]].append(item[0])
    }
    guard let s_roadTemp = readLine() else { fatalError("Bad input") }
    let s_vertice = s_roadTemp.split(separator: " ").map{ String($0) }
    guard let s = Int(s_vertice[0].trimmingCharacters(in: .whitespacesAndNewlines))
        else { fatalError("Bad input") }
    BFS(s: s, V: n, E: m)
    var res = 0
    for k in 1...n {
        if k != s {
            res = printResult(s, k, path)
            fileHandle.write(String(res).data(using: .utf8)!)
            if k != n {
                fileHandle.write(" ".data(using: .utf8)!)
            }
        }
    }
    for k in 1...n {
        graph[k].removeAll(keepingCapacity: true)
    }
    if q != 0 {
        fileHandle.write("\n".data(using: .utf8)!)
    }
}
