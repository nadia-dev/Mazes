//
//  LongestPath.swift
//  Mazes
//
//  Created by Nadia on 11/7/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

class LongestPath: PathFinder {

    override init(withRows rows: Int, columns: Int, creationAlgorithmType: CreationAlgorithmType, startCellPositionType: StartCellPositionType) {
        super.init(withRows: rows, columns: columns, creationAlgorithmType: creationAlgorithmType, startCellPositionType: startCellPositionType)
        let newStartToDistance = constructor?.distances?.max() // run Dijkstra's algorithm and discover the most distant cell relative to start cell
        if let newDistances = newStartToDistance?.keys.first?.distances(),
            let goalToDistance = newDistances.max(),
            let goal = goalToDistance.keys.first {
            newDistances.pathToGoal(goal: goal, completion: { (distances) in
                self.constructor?.distances = distances
            })
        }
    }
}
