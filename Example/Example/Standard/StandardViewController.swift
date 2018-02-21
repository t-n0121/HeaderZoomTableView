//
//  StandardViewController.swift
//  Example
//
//  Created by Teruki Nakano on 2018/02/20.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit
import HeaderZoomTableView

class StandardViewController: UIViewController {

    @IBOutlet weak var tableView: HeaderZoomTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Default Setting
        tableView.headerImage = #imageLiteral(resourceName: "Image_standard")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
