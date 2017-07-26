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
