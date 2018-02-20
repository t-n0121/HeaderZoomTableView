//
//  HeaderZoomTableView.swift
//  HeaderZoomTableView
//
//  Created by Teruki Nakano on 2018/02/18.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit

public class HeaderZoomTableView: UITableView {

    private let headerImageView = HeaderImageView()

    override public var contentOffset: CGPoint {
        didSet{
            if contentOffset.y > 0 {
                return
            }

            let height = headerImageView.frame.height - contentOffset.y
            headerImageView.imageHeight = height
        }
    }

    @IBInspectable public var headerImage: UIImage = UIImage() {
        didSet {
            headerImageView.headerImage = headerImage
        }
    }

    public var imageAspectRatio: ImageAspectRatio = .standard {
        didSet{
            headerImageView.imageAspectRatio = imageAspectRatio
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

        let width = self.bounds.width
        let height = width * aspect

        headerImageView.frame = CGRect(origin: .zero, size: CGSize(width: self.bounds.width, height: height))
        self.tableHeaderView = headerImageView
    }
}

