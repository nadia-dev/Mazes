//
//  ViewController.swift
//  Mazes
//
//  Created by Nadia on 7/25/17.
//  Copyright © 2017 Nadia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gridConstructor = GridConstructor(withRows: 4, columns: 4)
        let modifiedGC = SideWinder.on(gridConstructor: gridConstructor)
        print(modifiedGC.description())
    }

}

