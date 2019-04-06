//
//  Queue.swift
//  SNY
//
//  Created by Thanh-Tam Le on 30/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

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
