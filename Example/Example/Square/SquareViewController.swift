//
//  SquareViewController.swift
//  Example
//
//  Created by Teruki Nakano on 2018/02/20.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit
import HeaderZoomTableView

class SquareViewController: UIViewController {

    @IBOutlet weak var tableView: HeaderZoomTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // for square(w1:h1)
        tableView.headerImage = #imageLiteral(resourceName: "Image_square")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
