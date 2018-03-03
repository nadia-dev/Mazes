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
    
    func showAllDijkstraDistances() -> String? {
//        guard let gridConstructor = gridConstructor else {
//            return nil
//        }
//        let start = gridConstructor.gridWrapper?[0, 0]
//        let distances = start?.distances()
        gridConstructor?.distances = self.distances
        return gridConstructor?.description()
    }
    
    func showShortestPath(toGoalCell goalCell: Cell, _ completion: (_ description: String?) -> ()) {
            distances?.pathToGoal(goal: goalCell, completion: { (distancesToGoal) in
                self.gridConstructor?.distances = distancesToGoal
//                print("Path from northwest corner to southwest corner:")
//
//                print(updatedGridConstructor.description())
                if let constructor = self.gridConstructor {
                    completion(constructor.description())
                } else {
                    completion(nil)
                }
                //completion(self.gridConstructor?.description())
                //return updatedGridConstructor.description()
            })
    }
    
    
    
}
