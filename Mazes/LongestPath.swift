//
//  LongestPath.swift
//  Mazes
//
//  Created by Nadia on 11/7/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

class LongestPath {
    
    private let grid = DistanceGridConstructor(withRows: 5, columns: 5)
    
    init() {
        //self.init()
        let constructor = BinaryTree.on(gridConstructor: grid)
        let start = constructor.gridWrapper?[0, 0] // chose NW corner as starting cell
        let distances = start?.distances()
        let newStartToDistance = distances?.max() // run Dijkstra's algorithm and discover the most distant cell relative to start cell
        guard let newDistances = newStartToDistance?.keys.first?.distances() as? Distances else {
            return
        }
        let goalToDistance = newDistances.max()
        if let goal = goalToDistance?.keys.first {
            newDistances.pathToGoal(goal: goal, completion: { [weak self](distances) in
                self?.grid.distances = distances
                //print(self?.grid)
            })
        }
    }
}
