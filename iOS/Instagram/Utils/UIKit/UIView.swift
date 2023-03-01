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
    
    enum BorderSide: String {
        case top
        case left
        case right
        case buttom
    }
    
    
    /// Adding a single side from a  CALayer object as the border to a view
    /// - Parameters:
    ///   - side: specify the side to append a
    ///   - borderWidth: thinckness of the border
    ///   - borderColor: color of the border
    func addBorder(side: BorderSide, borderWidth: CGFloat = 0.5, borderColor: UIColor = .label) {
        var x: CGFloat
        var y: CGFloat
        var width: CGFloat
        var height: CGFloat
        switch side {
        case .top:
            x = 0; y = 0; width = frame.size.width; height = borderWidth
        case .buttom:
            x = 0; y = frame.size.height - borderWidth; width = frame.size.width; height = borderWidth
        case .left:
            x = 0; y = 0; width = borderWidth; height = frame.size.height
        case .right:
            x = frame.size.width - borderWidth; y = 0; width = borderWidth; height = frame.size.height
        }
        
        let border = CALayer()
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        border.backgroundColor = borderColor.cgColor
        layer.addSublayer(border)
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
    
    func makeSpacer(width: CGFloat, height: CGFloat) -> UIView {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spacer.widthAnchor.constraint(equalToConstant: width),
            spacer.heightAnchor.constraint(equalToConstant: height)
        ])
        return spacer
    }
    
    func clearConstraints() {
        for subview in self.subviews {
            subview.clearConstraints()
        }
        self.removeConstraints(self.constraints)
    }
}
