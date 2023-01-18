//
//  MainButton.swift
//  Instagram
//
//  Created by Huang Yan on 11/7/22.
//

import UIKit
class MainButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    init(title: String?) {
        super.init(frame: CGRect())
        setTitle(title, for: .normal)
        style()
    }
    init(systemName: String, size: CGFloat) {
        super.init(frame: CGRect())
        setImage(UIImage.actionImage(systemName: systemName, size: size), for: .normal)
        style()
    }
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .label
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

