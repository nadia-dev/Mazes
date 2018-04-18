//
//  Dijkstra.swift
//  Mazes
//
//  Created by Nadia on 3/2/18.
//  Copyright © 2018 Nadia. All rights reserved.
//
import Foundation

class Dijkstra: PathFinder {

    override init(withRows rows: Int, columns: Int, creationAlgorithmType: CreationAlgorithmType, startCellPositionType: StartCellPositionType) {
        super.init(withRows: rows, columns: columns, creationAlgorithmType: creationAlgorithmType, startCellPositionType: startCellPositionType)
        constructor?.distances = startCell?.distances()
    }
}
