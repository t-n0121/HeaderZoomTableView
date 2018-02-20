//
//  ImageAspectRatio.swift
//  HeaderZoomTableViewPackageDescription
//
//  Created by Teruki Nakano on 2018/02/20.
//

import Foundation

public enum ImageAspectRatio {
    case standard                       // w4:h3
    case square                         // w1:h1
    case wide                           // w16:h9
    case custom(w: Float, h: Float) // for custom
}
