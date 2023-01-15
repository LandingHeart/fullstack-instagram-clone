//
//  UIView.swift
//  Instagram
//
//  Created by Huang Yan on 1/15/23.
//

import UIKit
extension UIView {
    
    /// Make the view's side anchor equal to another view's side anchor
    /// - Parameter view: target view to pin to
    func pin(to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    /// Make the view to be squared
    /// - Parameter sideLength: the length of the side
    func makeSquare(sideLength: CGFloat) {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: sideLength),
            heightAnchor.constraint(equalToConstant: sideLength)
        ])
    }
}
