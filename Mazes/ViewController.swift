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

    private var cellSide: CGFloat = 0.0
    private let offset: CGFloat = 20
    private let algorithm = LongestPath(withRows: Constants.rows, columns: Constants.columns, creationAlgorithmType: .aldousBroder, startCellPositionType: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMatrix()
        runAlgorithm()
    }
    
    private func runAlgorithm() {
        let presentation = Presentation(withGridConstructor: algorithm.constructor, start: algorithm.startCell)
        guard let distances = presentation.showAllDistances() else {
            return
        }
        print("All distances")
        print(distances)
        
        let originalDistances = algorithm.constructor?.distances
        if let goalCell = algorithm.constructor?.currentGrid()?[Constants.rows-1][0] {
            print("Searching for path to goal")
            algorithm.constructor?.distances?.pathToGoal(goal: goalCell, completion: { (distancesToGoal) in
                algorithm.constructor?.distances = distancesToGoal
                if let description = algorithm.constructor?.description() {
                    print("Path from northwest corner to southwest corner:")
                    print(description)
                }
            })
        }
        
        showCells(forDistances: originalDistances)
    }
    
    private func configureMatrix() {
        let viewHeight = self.view.frame.height - offset
        let viewWidth = self.view.frame.width - offset
        cellSide = min(viewWidth/CGFloat(Constants.columns), viewHeight/CGFloat(Constants.rows))
        mazeContainerWidth?.constant = cellSide * CGFloat(Constants.columns)
        mazeContainerHeight?.constant = cellSide * CGFloat(Constants.rows)
    }
    
    private func showCells(forDistances distances: Distances?) {
        algorithm.constructor?.forEachCell { (cell) in
            let x = CGFloat(cell.column) * cellSide
            let y = CGFloat(cell.row) * cellSide
            let cellView = CellView.create(cell: cell, cellSide: cellSide, x: x, y: y, distances: distances)
            mazeContainer?.addSubview(cellView)
        }
    }

}

