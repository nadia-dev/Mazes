//
//  Grid.swift
//  Mazes
//
//  Created by Nadia on 7/25/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import UIKit

/**
 Construct the grid of cells using GridWrapper
 **/
class GridConstructor {
    
    private var row_count: Int = 0
    private var column_count: Int = 0
    var gridWrapper: GridWrapper?

    convenience init(withRows rows: Int, columns: Int) {
        self.init()
        self.row_count = rows
        self.column_count = columns
        // Initialize the grid
        let grid = prepateGrid()
        // Initialize grid wrapper, which allows to use custom subscript
        self.gridWrapper = GridWrapper(withGrid: grid)
        for cell_row in grid {
            configureCells(cells: cell_row)
        }
    }
    
    func currentGrid() -> [[Cell]]? {
        return gridWrapper?.grid
    }
    
    func size() -> Int {
        return row_count * column_count
    }
    
    /** Setup 2d array of Cell instances **/
    func prepateGrid() -> [[Cell]] {
        var grid = [[Cell]]()
        var cellId = 0
        for row in 0 ..< row_count {
            var cellRow = [Cell]()
            for column in 0 ..< column_count {
                let cell = Cell(withRow: row, column: column, id: cellId)
                cellId += 1
                
                cellRow.append(cell)
            }
            grid.append(cellRow)
        }
        return grid
    }

    /** Tell each cell who is its neighbor to the north, south, west and east **/
    func configureCells(cells: [Cell]) {
        for cell in cells {
            let row = cell.row
            let column = cell.column
            cell.north = gridWrapper?[row-1, column]
            cell.south = gridWrapper?[row+1, column]
            cell.west = gridWrapper?[row, column-1]
            cell.east = gridWrapper?[row, column+1]
        }
    }
    
    /** Access random cell **/
    func randomCell() -> Cell? {
        let row = Random.randomNumber(inRange: 0...row_count-1)
        let col = Random.randomNumber(inRange: 0...column_count-1)
        return gridWrapper?[row, col]
    }
    
    /** Methods to perform operations with each row and cell **/
    func forEachRow(block: ([Cell]) -> ()) {
        if let currentGrid = currentGrid() {
            for row in currentGrid {
                block(row)
            }
        }
    }
    
    func forEachCell(block: (Cell) -> ()) {
        if let currentGrid = currentGrid() {
            for row in currentGrid {
                for cell in row {
                    block(cell)
                }
            }
        }
    }
    
    func description() -> String {
        var output = "+" +  String(repeating: "---+", count: column_count) + "\n"
        self.forEachRow { (row) in
            var top = "|"
            var bottom = "+"
            for cell in row {
                let body = "   " // 3 spaces
                let east_boundry = cell.isLinked(cell: cell.east) ? " " : "|"
                top += body + east_boundry
                let south_boundry = cell.isLinked(cell: cell.south) ? "   " : "---"
                let corner = "+"
                bottom += south_boundry + corner
            }
            output += top + "\n"
            output += bottom + "\n"
        }
        return output
    }

}








