//
//  UIImage.swift
//  Instagram
//
//  Created by Huang Yan on 10/29/22.
//
import UIKit
extension UIImage {
    func getAspectRatio() -> CGFloat {
        return size.width / size.height
    }
    static func actionImage(systemName: String, size: CGFloat) -> UIImage? {
        let configuration = UIImage.SymbolConfiguration(pointSize: size)
        return UIImage(systemName: systemName, withConfiguration: configuration)
    }
}
