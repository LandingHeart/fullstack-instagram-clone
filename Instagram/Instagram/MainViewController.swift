//
//  MainViewController.swift
//  Instagram
//
//  Created by Huang Yan on 10/17/22.
//

import UIKit
class MainViewController: UITabBarController {
    
    let barHeight: CGFloat = 90
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = barHeight
        tabBar.frame.origin.y = view.frame.height - barHeight
    }
    func setupViews() {
        let homeNC = UINavigationController(rootViewController: HomeViewController())
        homeNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let searchNC = UINavigationController(rootViewController: SearchViewController())
        searchNC.setTabBarImage(systemName: "magnifyingglass")
        let videoNC = UINavigationController(rootViewController: VideoViewController())
        videoNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "video"), selectedImage: UIImage(systemName: "video.fill"))
        let shopNC = UINavigationController(rootViewController: ShopViewController())
        shopNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bag"), selectedImage: UIImage(systemName: "bag.fill"))
        let profileNC = UINavigationController(rootViewController: ProfileViewController())
        profileNC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        viewControllers = [homeNC,searchNC,videoNC,shopNC,profileNC]
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .black
    }
    
}
