//
//  AsyncViewController.swift
//  Example
//
//  Created by Teruki Nakano on 2018/03/06.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit
import HeaderZoomTableView

class AsyncViewController: UIViewController {
    
    @IBOutlet weak var tableView: HeaderZoomTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlStr = "https://github.com/t-n0121/HeaderZoomTableView/blob/master/Example/Example/Assets.xcassets/New%20Folder/Image_square.imageset/Image_square.jpg?raw=false"
        let url: URL = URL(string: urlStr)!

        // for URLSession
        // use headerImage(UIImage)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil, case .some(let result) = data, let image = UIImage(data: result) {

                DispatchQueue.main.async { [weak self] in
                    self?.tableView.headerImage = image
                }
            }
        }.resume()


        // use headerImageView(UIImageView)
        // let imageView = tableView.headerImageView

//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if error == nil, case .some(let result) = data, let image = UIImage(data: result) {
//
//                DispatchQueue.main.async {
//                    imageView.image = image
//                }
//            }
//        }.resume()


        /*
         Use third party library example
         Attention!!!
         This Library is not installed 3rd party library
         How install please refer to URL for each
         */

        // Nuke
        // https://github.com/kean/Nuke

//        let imageView = tableView.headerImageView
//        Manager.shared.loadImage(with: url, into: imageView)



        // AlamofireImage
        // https://github.com/Alamofire/AlamofireImage

//        Alamofire.request().responseImage { [weak self] response in
//            if let image = response.result.value {
//                self?.tableView.headerImage = image
//            }
//        }

        // Kingfisher
        // https://github.com/onevcat/Kingfisher

//        let imageView = tableView.headerImageView
//        imageView.kf.setImage(with: url)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
