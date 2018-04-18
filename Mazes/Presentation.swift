//
//  Representation.swift
//  Mazes
//
//  Created by Nadia on 10/11/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

class Presentation {
    
    private var gridConstructor: DistanceGridConstructor?
    private var startCell: Cell?
    
    convenience init(withGridConstructor constructor: DistanceGridConstructor?, start: Cell?) {
        self.init()
        gridConstructor = constructor
        startCell = start
    }
    
    lazy var distances: Distances? = {
        return startCell?.distances()
    }()
    
    func showAllDistances() -> String? {
        gridConstructor?.distances = self.distances
        return gridConstructor?.description()
    }
    
    func showShortestPath(toGoalCell goalCell: Cell, _ completion: (_ description: String?) -> Void) {
            distances?.pathToGoal(goal: goalCell, completion: { [unowned self](distancesToGoal) in
                self.gridConstructor?.distances = distancesToGoal
                completion(self.gridConstructor?.description())
            })
    }

}
