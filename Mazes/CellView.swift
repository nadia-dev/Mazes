//
//  UIView+Utils.swift
//  Mazes
//
//  Created by Nadia on 7/31/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import UIKit

class CellView: UIView {
    
    private enum Border {
        case left
        case right
        case top
        case bottom
    }
    
    private var cell: Cell? {
        didSet {
            guard let cell = cell else {
                return
            }
            if cell.north == nil {
                self.addBorder(border: .top)
            }
            if cell.west == nil {
                self.addBorder(border: .left)
            }
            if !cell.isLinked(cell: cell.east) {
                self.addBorder(border: .right)
            }
            if !cell.isLinked(cell: cell.south) {
                self.addBorder(border: .bottom)
            }
        }
    }
    
    private var distances: Distances? {
        didSet {
            guard let cell = cell, let distances = distances, let maxes = distances.max() else {
                return
            }
            let distance = distances.getDistanceFromRootToCell(cell: cell)
            self.backgroundColor = getColor(distance: distance, maxDistances: maxes)
        }
    }
    
    class func create(cell: Cell, cellSide: CGFloat, x: CGFloat, y: CGFloat, distances: Distances?) -> CellView {
        let cellView = CellView(frame: CGRect(x: x, y: y, width: cellSide+1, height: cellSide+1))
        cellView.cell = cell
        cellView.distances = distances
        return cellView
    }
    
    private func getColor(distance: Int, maxDistances: [Cell: Int]) -> UIColor? {
        let firstKey = Array(maxDistances.keys)[0]
        if let maxDist = maxDistances[firstKey] {
            print(maxDist, distance)
            let intensity = (maxDist - distance)/maxDist
            let dark = CGFloat((255 * intensity))
            let bright = CGFloat(128 + (127 * intensity))
            print("instensity: \(intensity)")
            return UIColor(red: dark, green: bright, blue: dark, alpha: 1)
        }
        return nil
    }
    
    private func addBorder(border: CellView.Border) {
        self.setBorder(border: border, weight: 2, color: UIColor.black)
    }
    
    private func setBorder(border: CellView.Border, weight: CGFloat, color: UIColor ) {
        let lineView = UIView()
        addSubview(lineView)
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        switch border {
            
        case .left:
            lineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            lineView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            lineView.widthAnchor.constraint(equalToConstant: weight).isActive = true
            
        case .right:
            lineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            lineView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            lineView.widthAnchor.constraint(equalToConstant: weight).isActive = true
            
        case .top:
            lineView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            lineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            lineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: weight).isActive = true
            
        case .bottom:
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            lineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            lineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: weight).isActive = true
        }
    }
}
