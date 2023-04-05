//
//  IGPostCommentView.swift
//  Instagram
//
//  Created by Huang Yan on 2/25/23.
//

import UIKit

class IGPostCommentView: UIView {
    
    // UI components
    private lazy var posterLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Steven"
        label.isEditable = false
        label.isScrollEnabled = false
        label.font = .systemFont(ofSize: K.defaultFontSize, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var commentLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "hello"
        label.isEditable = false
        label.isScrollEnabled = false
        label.font = .systemFont(ofSize: K.defaultFontSize, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    //Logic
    public var poster: String = "" {
        didSet {
            posterLabel.text = poster
        }
    }
    public var comment: String = "" {
        didSet {
            commentLabel.text = comment
        }
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    public func nilText() {
        posterLabel.text = nil
        commentLabel.text = nil
    }
    
    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(posterLabel, commentLabel)
        
        NSLayoutConstraint.activate([
            posterLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            posterLabel.topAnchor.constraint(equalTo: self.topAnchor),
            posterLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            posterLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
            posterLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 120),
        
            commentLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            commentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            commentLabel.leftAnchor.constraint(equalTo: posterLabel.rightAnchor),
        ])
    }
}
