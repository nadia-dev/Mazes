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
    
    /* Takes the cell and figures out the path to this cell from the original starting point */
    func pathToGoal(goal: Cell, completion: (_ distances: Distances?) -> ()) {
        guard let root = root else {
            completion(nil)
            return
        }
        var current = goal // we'll work backward from goal cell
        let breadcrumbs = Distances(withRoot: root) // will only include cells that lie on the path
        if let dist = cells[current.id] {
            breadcrumbs.setDistanceFromRootToCell(cell: current, distance: dist)
        }
        
        while current != root {
            for neighbor in current.linkedCells() {
                if let neighborDist = cells[neighbor.id], let currentDist = cells[current.id] {
                    if neighborDist < currentDist { // if neighbor of current cell is closer to the root
                        breadcrumbs.setDistanceFromRootToCell(cell: neighbor, distance: neighborDist)
                        current = neighbor
                        break
                    }
                }
            }
        }
        completion(breadcrumbs)
    }
    
}
