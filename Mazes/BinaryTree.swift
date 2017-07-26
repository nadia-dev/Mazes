//
//  BinarySearch.swift
//  Mazes
//
//  Created by Nadia on 7/26/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation


class BinaryTree {
    
    class func on(gridConstructor: GridConstructor) -> GridConstructor {
        gridConstructor.forEachCell { (cell) in
            var neighbors: [Cell] = []
            if let north = cell.north {
                neighbors.append(north)
            }
            if let east = cell.east {
                neighbors.append(east)
            }
            if neighbors.count > 0 {
                let neighbor = neighbors.randomItem()
                cell.link(cell: neighbor)
            }
        }
        return gridConstructor
    }
}
