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
    }
    init(title: String?) {
        super.init(frame: CGRect())
        setTitle(title, for: .normal)
        style()
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .filled()
        backgroundColor = .systemBlue
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        titleLabel?.textColor = .label
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
