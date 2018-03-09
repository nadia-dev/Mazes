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
    
    convenience init(withGridConstructor constructor: DistanceGridConstructor?) {
        self.init()
        gridConstructor = constructor
    }
    
    lazy var distances: Distances? = {
        guard let gridConstructor = gridConstructor else {
            return nil
        }
        let start = gridConstructor.gridWrapper?[0, 0]
        return start?.distances()
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
