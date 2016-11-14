//
//  Collection+Shuffle.swift
//  MuziuQ
//
//  Created by William McGinty on 7/28/15.
//  Copyright © 2015 William McGinty. All rights reserved.
//

import Foundation

public extension MutableCollection where Index == Int {
    
    /// Shuffle the elements of `self` in-place
    public mutating func shuffle() {
        guard count >= 2 else { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = (endIndex - i).random + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}

public extension Collection {
    
    /// Return a copy of `self` with its elements shuffled
    public var shuffled: [Iterator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}
