//
//  CustomViewController.swift
//  Example
//
//  Created by Teruki Nakano on 2018/02/20.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit
import HeaderZoomTableView

class CustomViewController: UIViewController {

    @IBOutlet weak var tableView: HeaderZoomTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // for custom(e.g w375:h235)
        tableView.imageAspectRatio = .custom(w: 375.0, h: 235.0)
        tableView.headerImage = #imageLiteral(resourceName: "Image_custom")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
