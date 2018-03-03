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
        let start = gridConstructor.gridWrapper?[0, 0] // chose NW corner as starting cell
        let distances = start?.distances()
        gridConstructor.distances = distances
        self.constructor = gridConstructor
    }
}
