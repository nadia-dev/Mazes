//
//  ViewController.swift
//  Mazes
//
//  Created by Nadia on 7/25/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mazeContainer: MazeContainer?
    @IBOutlet weak var mazeContainerHeight: NSLayoutConstraint?
    @IBOutlet weak var mazeContainerWidth: NSLayoutConstraint?
    
    private var rows: Int = 5
    private var columns: Int = 5
    private var offset: CGFloat = 20
    
    private var gridConstructor: DistanceGridConstructor?
    private var cellSide: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        gridConstructor = DistanceGridConstructor(withRows: rows, columns: columns)
        runAlgorithm()
        configureMatrix()
        showCells()
    }
    
    private func runAlgorithm() {
        guard let gridConstructor = gridConstructor else {
            return
        }
        if let updatedGridConstructor = SideWinder.on(gridConstructor: gridConstructor) as? DistanceGridConstructor {
            let start = updatedGridConstructor.gridWrapper?[0, 0]
            let distances = start?.distances()
            updatedGridConstructor.distances = distances
            print("All distances:")
            print(updatedGridConstructor.description())
            
            if let goalCell = updatedGridConstructor.currentGrid()?[rows-1][0] {
                distances?.pathToGoal(goal: goalCell, completion: { (distancesToGoal) in
                    updatedGridConstructor.distances = distancesToGoal
                    print("Path from northwest corner to southwest corner:")
                    print(updatedGridConstructor.description())
                })
            }
            
            self.gridConstructor = updatedGridConstructor
        }
    }
    
    private func configureMatrix() {
        let viewHeight = self.view.frame.height - offset
        let viewWidth = self.view.frame.width - offset
        cellSide = min(viewWidth/CGFloat(columns), viewHeight/CGFloat(rows))
        mazeContainerWidth?.constant = cellSide * CGFloat(columns)
        mazeContainerHeight?.constant = cellSide * CGFloat(rows)
    }
    
    
    private func showCells() {
        guard let gridConstructor = gridConstructor else {
            return
        }
        gridConstructor.forEachCell { (cell) in
            let x = CGFloat(cell.column) * cellSide
            let y = CGFloat(cell.row) * cellSide
            let cellView = UIView(frame: CGRect(x: x, y: y, width: cellSide+1, height: cellSide+1))
            
            if cell.north == nil {
                cellView.addBorder(border: .top)
            }
            if cell.west == nil {
                cellView.addBorder(border: .left)
            }
            if !cell.isLinked(cell: cell.east) {
                cellView.addBorder(border: .right)
            }
            if !cell.isLinked(cell: cell.south) {
                cellView.addBorder(border: .bottom)
            }
            
            mazeContainer?.addSubview(cellView)
        }
    }

}

