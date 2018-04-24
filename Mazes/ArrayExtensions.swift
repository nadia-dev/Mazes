//
//  ArrayExtensions.swift
//  Mazes
//
//  Created by Nadia on 7/26/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

extension Array {
    
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

extension Array where Element: Cell {

    mutating func delete(cell: Element) {
        self = self.filter { $0.id != cell.id }
    }

    func randomCellExcept(withId id: Int) -> Cell {
        let randomCell = self.randomItem()
        if randomCell.id == id {
            //redo
            return randomCellExcept(withId: id)
        } else {
            return randomCell
        }
    }

    func description() -> String {
        var result = ""
        for i in self {
            result += String(i.id) + " "
        }
        return result
    }
}
