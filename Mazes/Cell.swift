//
//  Cell.swift
//  Mazes
//
//  Created by Nadia on 7/25/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import UIKit

class Cell {
    
    var id: Int = -1
    var row: Int = -1
    var column: Int = -1
    var north: Cell?
    var south: Cell?
    var east: Cell?
    var west: Cell?
    
    private var links: [Int:Bool] = [:]
    
    convenience init(withRow row: Int, column: Int, id: Int) {
        self.init()
        self.row = row
        self.column = column
        self.id = id
    }
    
    /** Connect current cell with cell parameter **/
    func link(cell: Cell, bidi: Bool = true) {
        if !linkedCells().contains(cell.id) {
            links[cell.id] = true
            if bidi {
                cell.link(cell: self, bidi: false)
            }
        }
    }
    
    /** Disconnet current cell and parameter cell **/
    func unlink(cell: Cell, bidi: Bool = true) {
        if linkedCells().contains(cell.id) {
            links.removeValue(forKey: cell.id)
            if bidi {
                cell.unlink(cell: self, bidi: false)
            }
        }
    }
    
    /** Query list of ids of cells connected to the current cell **/
    func linkedCells() -> [Int] {
        return Array(links.keys)
    }
    
    /** Is current cell linked to another given cell **/
    func isLinked(cell: Cell?) -> Bool {
        if let cell = cell {
            return linkedCells().contains(cell.id)
        } else {
            return false
        }
    }
    
    /** Query the list of adjoined cells **/
    func neighborCells() -> [Cell] {
        var list: [Cell] = []
        if let north = self.north {
            list.append(north)
        }
        if let south = self.south {
            list.append(south)
        }
        if let east = self.east {
            list.append(east)
        }
        if let west = self.west {
            list.append(west)
        }
        return list
    }
 

}















