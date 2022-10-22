//
//  MainViewController.swift
//  Instagram
//
//  Created by Huang Yan on 10/17/22.
//

import UIKit
class MainViewController: UITabBarController {
    
    let homeNC = UINavigationController(rootViewController: HomeViewController())
    
    let searchNC = SearchViewController()
    
    let videoNC = UINavigationController(rootViewController: VideoViewController())
    
    let shopNC = UINavigationController(rootViewController: ShopViewController())
    
    let profileNC = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBars()
    }
    override func viewDidLayoutSubviews() {
        let barHeight: CGFloat = 88
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = barHeight
        tabBar.frame.origin.y = view.frame.height - barHeight
    }
    private func setupViews() {
        
        homeNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        searchNC.setTabBarImage(systemName: "magnifyingglass")
        
        videoNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "video"), selectedImage: UIImage(systemName: "video.fill"))
        
        shopNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bag"), selectedImage: UIImage(systemName: "bag.fill"))
        
        profileNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        
        viewControllers = [homeNC,searchNC,videoNC,shopNC,profileNC]
        
    }
    private func setupBars() {
        homeNC.navigationBar.tintColor = .systemBackground
        
        videoNC.navigationBar.tintColor = .systemBackground
        
        shopNC.navigationBar.tintColor = .systemBackground
        
        profileNC.navigationBar.tintColor = .systemBackground
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .systemBackground
    }
}
