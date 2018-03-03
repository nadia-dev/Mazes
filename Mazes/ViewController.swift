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
    private let algorithm = Dijkstra(withRows: Constants.rows, columns: Constants.columns)

    override func viewDidLoad() {
        super.viewDidLoad()
        runAlgorithm()
        configureMatrix()
        showCells()
    }
    
    private func runAlgorithm() {
        let presentation = Presentation(withGridConstructor: algorithm.constructor)
        guard let distances = presentation.showAllDistances() else {
            return
        }
        print("All distances")
        print(distances)
        
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
    }
    
    private func configureMatrix() {
        let viewHeight = self.view.frame.height - offset
        let viewWidth = self.view.frame.width - offset
        cellSide = min(viewWidth/CGFloat(Constants.columns), viewHeight/CGFloat(Constants.rows))
        mazeContainerWidth?.constant = cellSide * CGFloat(Constants.columns)
        mazeContainerHeight?.constant = cellSide * CGFloat(Constants.rows)
    }
    
    
    private func showCells() {
        guard let gridConstructor = algorithm.constructor else {
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

