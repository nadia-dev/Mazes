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
        // TODO: - fix random cases never return
        var unvisited: [Cell] = []
        gridConstructor.forEachCell { (cell) in
            unvisited.append(cell)
        }
        let first = unvisited.randomItem()
        unvisited.delete(cell: first)
        while unvisited.count > 0 {
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
            let bound = path.count > 2 ? path.count - 2 : path.count
            for i in 0..<bound {
                if i + 1 < bound {
                    path[i].link(cell: path[i+1])
                }
                unvisited.delete(cell: cell)
            }
        }
        return gridConstructor
    }
    
}
