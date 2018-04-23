//
//  AldousBroder.swift
//  Mazes
//
//  Created by Nadia Yudina on 4/22/18.
//  Copyright © 2018 Nadia. All rights reserved.
//

import Foundation

class AldousBroder {

    class func on(gridConstructor: GridConstructor) -> GridConstructor {
        var cell = gridConstructor.randomCell
        var unvisited = gridConstructor.size() - 1
        while unvisited > 0 {
            if let neighbor = cell?.neighborCells.randomItem() {
                if neighbor.linkedCells.count == 0 {
                    cell?.link(cell: neighbor)
                    unvisited -= 1
                }
                cell = neighbor
            }
        }
        return gridConstructor
    }
}


