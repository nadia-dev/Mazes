//
//  GridContainer.swift
//  Mazes
//
//  Created by Nadia on 7/26/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

/** 
 Class allows to use custom subscript
 **/
class GridWrapper {
    
    var grid: [[Cell]] = [[]]
    
    init(withGrid grid: [[Cell]]) {
        self.grid = grid
    }
    
    subscript(row: Int, column: Int) -> Cell? {
        if !(0..<grid.count).contains(row) {
            return nil
        }
        if !(0..<grid[0].count).contains(column) {
            return nil
        }
        return grid[row][column]
    }
}
