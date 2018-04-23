//
//  Wilsons.swift
//  Mazes
//
//  Created by Nadia Yudina on 4/22/18.
//  Copyright © 2018 Nadia. All rights reserved.
//

import Foundation

class Wilsons {

    class func on(gridConstructor: GridConstructor) -> GridConstructor {
        var unvisited: [Cell] = []
        gridConstructor.forEachCell { (cell) in
            unvisited.append(cell)
        }
        let first = unvisited.randomItem()
        unvisited = unvisited.filter { $0.id != first.id }
        while unvisited.count != 0 {
            var cell = unvisited.randomItem()
            var path = [cell]
            while unvisited.contains(cell) {
                cell = cell.neighborCells.randomItem()
                if let position = path.index(of: cell) {
                    path = Array(path[0..<position])
                } else {
                    path.append(cell)
                }
            }
            for i in 0..<path.count - 2
        }
//        var cell = gridConstructor.randomCell
//        var unvisited = gridConstructor.size() - 1
//        while unvisited > 0 {
//            if let neighbor = cell?.neighborCells.randomItem() {
//                if neighbor.linkedCells.count == 0 {
//                    cell?.link(cell: neighbor)
//                    unvisited -= 1
//                }
//                cell = neighbor
//            }
//        }
//        return gridConstructor
    }
    
}
