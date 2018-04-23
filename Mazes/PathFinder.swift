//
//  PathFinder.swift
//  Mazes
//
//  Created by Nadia on 3/3/18.
//  Copyright © 2018 Nadia. All rights reserved.
//

import Foundation

enum CreationAlgorithmType {
    case binaryTree
    case sideWinder
    case aldousBroder
    case wilsons
}

enum StartCellPositionType {
    case northEast
    case center
}

class PathFinder {
    
    var constructor: DistanceGridConstructor?
    var startCell: Cell?
    
    init(withRows rows: Int, columns: Int, creationAlgorithmType: CreationAlgorithmType, startCellPositionType: StartCellPositionType) {
        switch creationAlgorithmType {
        case .binaryTree:
            constructor = BinaryTree.on(gridConstructor: DistanceGridConstructor(withRows: rows, columns: columns)) as? DistanceGridConstructor
        case .sideWinder:
            constructor = SideWinder.on(gridConstructor: DistanceGridConstructor(withRows: rows, columns: columns)) as? DistanceGridConstructor
        case .aldousBroder:
            constructor = AldousBroder.on(gridConstructor: DistanceGridConstructor(withRows: rows, columns: columns)) as? DistanceGridConstructor
        case .wilsons:
            constructor = Wilsons.on(gridConstructor: DistanceGridConstructor(withRows: rows, columns: columns)) as? DistanceGridConstructor
        }
        var startX = 0
        var startY = 0
        switch startCellPositionType {
        case .northEast:
            break
        case .center:
            startX = rows/2
            startY = columns/2
        }
        startCell = constructor?.gridWrapper?[startX, startY]
    }
}
