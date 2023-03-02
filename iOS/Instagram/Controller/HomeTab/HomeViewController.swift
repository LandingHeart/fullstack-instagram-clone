//
//  HomeViewController.swift
//  Instagram
//
//  Created by Huang Yan on 2/23/23.
//

import UIKit

/// Home Page ViewController
final class HomeViewController: UIViewController {
    
    private let postListView: IGPostListView = {
        let postListView = IGPostListView()
        return postListView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar()
        layout()
    }
    
    
    private func layout() {
        view.addSubviews(postListView)
        
        NSLayoutConstraint.activate([
            postListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            postListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            postListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
