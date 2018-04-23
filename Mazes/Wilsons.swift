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
        print("first: \(first.description())")
        unvisited.delete(cell: first)
        while unvisited.count != 0 {
            var cell = unvisited.randomItem()
            print("random cell: \(cell.description())")
            var path = [cell]
            print("path set to random cell: \(path.description())")
            print("unvisited cells: \(unvisited.description())")
            while unvisited.contains(cell) {
                cell = cell.neighborCells.randomItem()
                print("random neighbor: \(cell.description())")
                if let position = path.index(of: cell) {
                    print("position of random neighbor: \(position)")
                    path = Array(path.prefix(upTo: position+1))
                    print("updated path: \(path.description())")
                } else {
                    path.append(cell)
                    print("path after neighbor append: \(path.description())")
                }
            }
            for i in 0..<path.count - 2 {
                path[i].link(cell: path[i+1])
                unvisited.delete(cell: path[i])
            }
        }
        return gridConstructor
    }
    
}
