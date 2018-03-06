//
//  HeaderImageView.swift
//  HeaderZoomTableView
//
//  Created by Teruki Nakano on 2018/02/16.
//  Copyright © 2018年 Teruki Nakano. All rights reserved.
//

import UIKit

class HeaderImageView: UIView {

	@IBOutlet private weak var imageView: UIImageView!
	@IBOutlet private weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewAspectConstraint: NSLayoutConstraint!

	@IBInspectable var headerImage: UIImage = UIImage() {
		didSet {
			imageView.image = headerImage
		}
	}

    var headerImageView: UIImageView {
        return imageView
    }

    var imageAspectRatio: ImageAspectRatio = .standard {
        didSet{

            imageView.removeConstraint(imageViewAspectConstraint)

            switch imageAspectRatio {
            case .standard:
                imageViewAspectConstraint = imageAspectConstriant(width: 4, height: 3)
            case .square:
                imageViewAspectConstraint = imageAspectConstriant(width: 1, height: 1)
            case .wide:
                imageViewAspectConstraint = imageAspectConstriant(width: 16, height: 9)
            case .custom(let w, let h):
                imageViewAspectConstraint = imageAspectConstriant(width: CGFloat(w), height: CGFloat(h))
            }

            NSLayoutConstraint.activate([imageViewAspectConstraint])
        }
    }

	var imageHeight: CGFloat = 0 {
		didSet{
			imageViewHeightConstraint.constant = imageHeight
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		loadNib()
	}

    required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		loadNib()
	}

    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewWidthConstraint.constant = self.bounds.width
    }

	private func loadNib() {
		let bundle = Bundle(for: type(of: self))
		guard let view = UINib(nibName: "HeaderImageView", bundle: bundle).instantiate(withOwner: self, options: nil).first as? UIView else {
			return
		}
		self.addSubview(view)

		view.translatesAutoresizingMaskIntoConstraints = false
		view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
	}

    private func imageAspectConstriant(width: CGFloat, height: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: imageView,
            attribute: NSLayoutAttribute.width,
            multiplier: height / width,
            constant: 0
        )
    }
}
