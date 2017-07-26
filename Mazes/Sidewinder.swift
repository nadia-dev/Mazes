//
//  Sidewinder.swift
//  Mazes
//
//  Created by Nadia on 7/26/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation


class SideWinder {
    
    class func on(gridConstructor: GridConstructor) -> GridConstructor {
        gridConstructor.forEachRow { (row) in
            var run: [Cell] = []
            for cell in row {
                run.append(cell)
                let atEasternBoundary = cell.east == nil
                let atNorthernBoundary = cell.north == nil
                let shouldCloseOut = atEasternBoundary || (!atNorthernBoundary && Random.randomNumber(inRange: 0...2) == 0)
                if shouldCloseOut {
                    let selectedCell = row.randomItem()
                    if let north = selectedCell.north {
                        selectedCell.link(cell: north)
                        run.removeAll()
                    }
                } else {
                    if let east = cell.east {
                        cell.link(cell: east)
                    }
                }
            }
        }
        return gridConstructor
    }
}
