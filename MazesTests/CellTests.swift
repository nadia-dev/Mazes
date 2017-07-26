//
//  CellTests.swift
//  Mazes
//
//  Created by Nadia on 7/25/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import XCTest
@testable import Mazes

class CellTests: XCTestCase {
    
    var cell1: Cell!
    var cell2: Cell!
    var cell3: Cell!
    var cell4: Cell!
    
    override func setUp() {
        super.setUp()
        cell1 = Cell(withRow: 0, column: 0, id: 1)
        cell2 = Cell(withRow: 0, column: 1, id: 2)
        cell3 = Cell(withRow: 1, column: 0, id: 3)
        cell4 = Cell(withRow: 1, column: 1, id: 4)
        
        cell1.south = cell3
        cell1.east = cell2
    }
    
    override func tearDown() {
        cell1 = nil
        cell2 = nil
        super.tearDown()
    }
    
    func testLinkUnlink() {
        cell1.link(cell: cell2)
        XCTAssertTrue(cell1.isLinked(cell: cell2), "Failed to link two cells")
        cell1.unlink(cell: cell2)
        XCTAssertFalse(cell1.isLinked(cell: cell2), "Failed to unlink two cells")
    }
    
    func testNeighborCells() {
        XCTAssertTrue(cell1.neighborCells().count == 2, "Failed to find neighbor cells")
    }
    

    
}
