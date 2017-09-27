//
//  File.swift
//  Mazes
//
//  Created by Nadia on 7/25/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import Foundation

class Random {
    
    /** 
     Returns a random number in the inteval, inclusive:
     Examples:
        randomNumber() - returns a random number between 1 and 6
        randomNumber(inRange: 50...100) - returns a number between 50 and 100 inclusive
     **/
    class func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64((range.upperBound - range.lowerBound + 1))
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }
}
