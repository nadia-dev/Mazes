//
//  Dijkstra.swift
//  Mazes
//
//  Created by Nadia on 3/2/18.
//  Copyright © 2018 Nadia. All rights reserved.
//
import Foundation

class Dijkstra: PathFinder {

    init(withRows rows: Int, columns: Int) {
        super.init()
        guard let gridConstructor = BinaryTree.on(gridConstructor: DistanceGridConstructor(withRows: rows, columns: columns)) as? DistanceGridConstructor else {
            return
        }
        startCell = gridConstructor.gridWrapper?[rows/2, columns/2]
        let distances = startCell?.distances()
        gridConstructor.distances = distances
        self.constructor = gridConstructor
    }
}
