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
            // TODO: should be in hex, to represent dists up to 35 using one char
            return String(dist)
        } else {
            return super.contentsOfCell(cell: cell)
        }
    }
    
}
