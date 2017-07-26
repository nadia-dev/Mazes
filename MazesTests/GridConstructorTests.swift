//
//  GridContainerTests.swift
//  Mazes
//
//  Created by Nadia on 7/26/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import XCTest
@testable import Mazes

class GridConstructorTests: XCTestCase {
    
    var gridConstructor: GridConstructor!
    var rows = 3
    var columns = 2
    
    override func setUp() {
        super.setUp()
        gridConstructor = GridConstructor(withRows: rows, columns: columns)
    }
    
    override func tearDown() {
        gridConstructor = nil
        super.tearDown()
    }
    
    func testGridWrapper() {
        XCTAssertNotNil(gridConstructor.gridWrapper)
    }
    
    func testSize() {
        XCTAssertEqual(gridConstructor.size(), rows*columns)
    }
    
    func testRandomCell() {
        XCTAssertNotNil(gridConstructor.randomCell())
    }
    
    func testNeighbors() {
        if let grid = gridConstructor.currentGrid() {
            let cell1 = grid[0][0]
            XCTAssertEqual(cell1.neighborCells().count, 2)
            XCTAssertNotNil(cell1.east)
            XCTAssertNotNil(cell1.south)
            XCTAssertNil(cell1.north)
            XCTAssertNil(cell1.west)
            
            let cell2 = grid[1][0]
            XCTAssertEqual(cell2.neighborCells().count, 3)
            
            let cell3 = grid[2][1]
            XCTAssertEqual(cell3.neighborCells().count, 2)
        } else {
            XCTFail("No grid found in GridConstructorTests")
        }
    }

    
}
