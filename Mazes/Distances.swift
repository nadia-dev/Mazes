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
    
    func getDistanceFromRootToCellWithId(id: Int) -> Int {
        if let dist = cells[id] {
            return dist
        } else {
            return -1
        }
    }
    
    func getDistanceFromRootToCell(cell: Cell) -> Int {
        if let dist = cells[cell.id] {
            return dist
        } else {
            return -1
        }
    }
    
    func setDistanceFromRootToCellWithId(id: Int, distance: Int) {
        cells[id] = distance
    }
    
    func setDistanceFromRootToCell(cell: Cell, distance: Int) {
        cells[cell.id] = distance
    }
    
    func allCells() -> [Int] {
        // return list of all cell ids
        return Array(cells.keys)
    }
    
}
