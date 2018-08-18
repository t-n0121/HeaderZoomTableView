//
//  HeaderZoomTableView.swift
//  HeaderZoomTableView
//
//  Created by Teruki Nakano on 2018/02/18.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit

public class HeaderZoomTableView: UITableView {

    private let headerView = HeaderImageView()

    override public var contentOffset: CGPoint {
        didSet{
            if contentOffset.y > 0 {
                return
            }

            let height = headerView.frame.height - contentOffset.y
            headerView.imageHeight = height
        }
    }

    @IBInspectable public var headerImage: UIImage = UIImage() {
        didSet {
            headerView.headerImage = headerImage
            imageAspectRatio = .custom(w: Float(headerImage.size.width), h: Float(headerImage.size.height))
        }
    }

    public var headerImageView: UIImageView {
        return headerView.headerImageView
    }

    public var imageAspectRatio: ImageAspectRatio = .standard {
        didSet{
            headerView.imageAspectRatio = imageAspectRatio
            setUpCoverImage()
        }
    }

    public override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        setUpCoverImage()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCoverImage()
    }

    private func setUpCoverImage() {
        var aspect: CGFloat = CGFloat(3.0 / 4.0)
        switch imageAspectRatio {
        case .standard:
            aspect = CGFloat(3.0 / 4.0)
        case .square:
            aspect = CGFloat(1.0 / 1.0)
        case .wide:
            aspect = CGFloat(9.0 / 16.0)
        case .custom(let w, let h):
            aspect = CGFloat(h / w)
        }

        let width = UIScreen.main.bounds.width
        let height = width * aspect

        headerView.frame = CGRect(origin: .zero, size: CGSize(width: width, height: height))
        self.tableHeaderView = headerView
    }
}

