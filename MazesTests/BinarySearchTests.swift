//
//  BinarySearchTests.swift
//  Mazes
//
//  Created by Nadia on 7/26/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import XCTest
@testable import Mazes

class BinarySearchTests: XCTestCase {
    
    var gridConstructor: GridConstructor!
    var binarySearch: BinarySearch!
    var rows = 3
    var columns = 2
    
    override func setUp() {
        super.setUp()
        gridConstructor = GridConstructor(withRows: rows, columns: columns)
        binarySearch = BinarySearch()
    }
    
    override func tearDown() {
        gridConstructor = nil
        binarySearch = nil
        super.tearDown()
    }
    
    func testOn() {
        if let grid = binarySearch.on(gridConstructor: gridConstructor) {
            let cell1 = grid[0][0]
            XCTAssertEqual(cell1.linkedCells().count, 1)
            
            let cell2 = grid[1][0]
            XCTAssertEqual(cell2.linkedCells().count, 2)
        } else {
            XCTFail("No grid found in BinarySearchTests")
        }
    }
    
}
