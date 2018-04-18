//
//  LongestPath.swift
//  Mazes
//
//  Created by Nadia on 11/7/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

class LongestPath: PathFinder {

    init(withRows rows: Int, columns: Int) {
        super.init()
        guard let gridConstructor = BinaryTree.on(gridConstructor: DistanceGridConstructor(withRows: rows, columns: columns)) as? DistanceGridConstructor else {
            return
        }
        startCell = gridConstructor.gridWrapper?[rows/2, columns/2]
        let distances = startCell?.distances()
        let newStartToDistance = distances?.max() // run Dijkstra's algorithm and discover the most distant cell relative to start cell
        if let newDistances = newStartToDistance?.keys.first?.distances(),
            let goalToDistance = newDistances.max(),
            let goal = goalToDistance.keys.first {
            newDistances.pathToGoal(goal: goal, completion: { (distances) in
                gridConstructor.distances = distances
                self.constructor = gridConstructor
            })
        }
    }
}
