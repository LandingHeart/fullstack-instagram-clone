//
//  SeparatorView.swift
//  Instagram
//
//  Created by Huang Yan on 1/8/23.
//

import UIKit
/// A separator with background color of .separator and rounded corner
class SeparatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: 100, height: 3)
    }
    
    private func style() {
        backgroundColor = .separator
    }
    override func layoutSubviews() {
        layer.cornerRadius = 3
        clipsToBounds = true
    }
}
