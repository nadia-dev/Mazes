//
//  Cell.swift
//  Mazes
//
//  Created by Nadia on 7/25/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import UIKit

class Cell : Hashable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: Cell, rhs: Cell) -> Bool {
        return lhs === rhs
    }

    
    var id: Int = -1
    var row: Int = -1
    var column: Int = -1
    var north: Cell?
    var south: Cell?
    var east: Cell?
    var west: Cell?
    
    var hashValue: Int { return ObjectIdentifier(self).hashValue }
    
    private var links: [Cell:Bool] = [:]
    
    convenience init(withRow row: Int, column: Int, id: Int) {
        self.init()
        self.row = row
        self.column = column
        self.id = id
    }
    
    /** Connect current cell with cell parameter **/
    func link(cell: Cell, bidi: Bool = true) {
        if !linkedCells.contains(cell) {
            links[cell] = true
            if bidi {
                cell.link(cell: self, bidi: false)
            }
        }
    }
    
    /** Disconnet current cell and parameter cell **/
    func unlink(cell: Cell, bidi: Bool = true) {
        if linkedCells.contains(cell) {
            links.removeValue(forKey: cell)
            if bidi {
                cell.unlink(cell: self, bidi: false)
            }
        }
    }
    
    /** Query list of ids of cells connected to the current cell **/
    var linkedCells: [Cell] {
        return Array(links.keys)
    }
    
    /** Is current cell linked to another given cell **/
    func isLinked(cell: Cell?) -> Bool {
        if let cell = cell {
            return linkedCells.contains(cell)
        } else {
            return false
        }
    }
    
    /** Query the list of adjoined cells **/
    var neighborCells: [Cell] {
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
 
    /** implement Dijkstra's algorithm and return Distances instance containing the matrix of distances **/
    func distances() -> Distances {
        let distances = Distances(withRoot: self)
        var frontier: [Cell] = [self]
        while frontier.count > 0 { // keep looping until there are no more cells in frontier (i.e. all distances are already measured)
            var newFrontier: [Cell] = [] // will hold all unvisited cells linked to to cell in current frontier
            for cell in frontier {
                for linked in cell.linkedCells {
                    if distances.getDistanceFromRootToCell(cell: linked) == -1 { // if cell hasn't been visited yet
                        let updatedDist = distances.getDistanceFromRootToCell(cell: cell) + 1
                        distances.setDistanceFromRootToCell(cell: linked, distance: updatedDist)
                        newFrontier.append(linked) // add cell to new frontier set
                    }
                }
            }
            frontier = newFrontier
        }
        return distances
    }

}















