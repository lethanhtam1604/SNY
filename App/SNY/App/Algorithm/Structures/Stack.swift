//
//  Stack.swift
//  SNY
//
//  Created by Thanh-Tam Le on 30/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

struct Stack<Element> {

    private var array: [Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func top() -> Element? {
        return array.last
    }
}
