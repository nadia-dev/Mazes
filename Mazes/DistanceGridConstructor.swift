//
//  DistanceGridConstructor.swift
//  Mazes
//
//  Created by Nadia on 9/24/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

class DistanceGridConstructor: GridConstructor {
    
    var distances: Distances?
    
    override func contentsOfCell(cell: Cell) -> String {
        if let dist = distances?.getDistanceFromRootToCell(cell: cell) {
            if dist != -1 {
                return " \(String(format: "%x", dist)) " // in hex
            } else {
                return " X "
            }
        } else {
            return super.contentsOfCell(cell: cell)
        }
    }
    
}
