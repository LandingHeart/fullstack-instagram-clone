//
//  UIViewController+Utils.swift
//  Instagram
//
//  Created by Huang Yan on 10/17/22.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
        navBarAppearance.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    
    }
    
    func setTabBarImage(
        systemName: String,
        configuration: UIImage.SymbolConfiguration = .init(scale: .large),
        title: String? = nil) {
        guard let image = UIImage(systemName: systemName, withConfiguration: configuration) else {
            return
        }
            tabBarItem = UITabBarItem(title: title ?? tabBarItem.title, image: image, tag: tabBarItem.tag)
    }
    
    func setNavBarTintColor(_ color: UIColor?) {
        navigationController?.navigationBar.tintColor = color
    }
}
