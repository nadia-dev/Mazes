//
//  Distances.swift
//  Mazes
//
//  Created by Nadia on 8/15/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

class Distances {
    
    /* Tracking how far each cell is from the refernce cell */
    
    private var cells: [Int:Int] = [:] // cell id to distance from cell with this id to starting point
    private var root: Cell?
    
    convenience init(withRoot r: Cell) {
        self.init()
        root = r
        cells[r.id] = 0
    }
    
    func getDistanceFromRootToCell(cell: Cell) -> Int {
        if let dist = cells[cell.id] {
            return dist
        } else {
            return -1
        }
    }
    
    func setDistanceFromRootToCell(cell: Cell, distance: Int) {
        cells[cell.id] = distance
    }
    
    func allCells() -> [Int] {
        // return list of all cell ids
        return Array(cells.keys)
    }
    
    func pathToGoal(goal: Cell) {
        guard let root = root else {
            return
        }
        let current = goal
        let breadcrumbs = Distances(withRoot: root)
        if let dist = cells[current.id] {
            breadcrumbs.setDistanceFromRootToCell(cell: current, distance: dist)
        }
        
        while current != root {
            
        }
        
    }
    
}
