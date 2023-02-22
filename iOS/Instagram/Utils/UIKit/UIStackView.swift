//
//  UIStackView.swift
//  Instagram
//
//  Created by Huang Yan on 1/21/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
