//
//  WideViewController.swift
//  Example
//
//  Created by Teruki Nakano on 2018/02/20.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit
import HeaderZoomTableView

class WideViewController: UIViewController {

    @IBOutlet weak var tableView: HeaderZoomTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // for wide(w16:h9)
        tableView.imageAspectRatio = .wide
        tableView.headerImage = #imageLiteral(resourceName: "Image_wide")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
