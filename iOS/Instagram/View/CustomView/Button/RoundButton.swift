//
//  RoundButton.swift
//  Instagram
//
//  Created by Huang Yan on 11/7/22.
//

import UIKit

class RoundButton: UIButton {
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
    func style() {
        backgroundColor = .cyan
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        titleLabel?.textColor = .label
    }
    func layout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
