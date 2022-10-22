//
//  PostCell.swift
//  Instagram
//
//  Created by Huang Yan on 10/20/22.
//

import UIKit

class PostCell: UITableViewCell {
    
    let VStack = UIStackView()
    
    let postHeader = PostHeaderView()
    
    let images = UIPageViewController()
    
    let actionStack = UIStackView()
    
    var visibleConstraint: NSLayoutConstraint = NSLayoutConstraint()
    var hiddenConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    static let rowHeight: CGFloat = 500
    static let reuseId = "PostCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setting up cell
    private func setup() {
        style()
        layout()
    }
}
//MARK: - style
extension PostCell {
    private func style() {
        VStack.translatesAutoresizingMaskIntoConstraints = false
        
        postHeader.translatesAutoresizingMaskIntoConstraints = false
    }
}
//MARK: - layout
extension PostCell {
    private func layout() {
        //adding views
        contentView.addSubview(VStack)
        VStack.addArrangedSubview(postHeader)
        //adding guides
        NSLayoutConstraint.activate([
            // views
            VStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            VStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            VStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            VStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postHeader.leadingAnchor.constraint(equalTo: VStack.leadingAnchor),
            postHeader.trailingAnchor.constraint(equalTo: VStack.trailingAnchor),
            
            // layout guides
        ])
        
    }
}
