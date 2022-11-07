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
        layout()
    }
    init(title: String?) {
        super.init(frame: CGRect())
        setTitle(title, for: .normal)
        style()
        layout()
    }
    init(systemName: String, size: CGFloat) {
        super.init(frame: CGRect())
        setImage(UIImage.actionImage(systemName: systemName, size: size), for: .normal)
        style()
        layout()
    }
    func style() {
        tintColor = .label
    }
    func layout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

