//
//  BinarySearchTests.swift
//  Mazes
//
//  Created by Nadia on 7/26/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import XCTest
@testable import Mazes

class AlgorithmsTests: XCTestCase {
    
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
    
    func testOn() {
        // "on" has random in it, so we can only test if the grid is the same as it was on a large scale
        BinaryTree.on(gridConstructor: gridConstructor)
        XCTAssertEqual(gridConstructor.size(), rows*columns)
        
        SideWinder.on(gridConstructor: gridConstructor)
        XCTAssertEqual(gridConstructor.size(), rows*columns)
    }
    
}
