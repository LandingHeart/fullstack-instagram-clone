//
//  HomeViewControllerNavBar.swift
//  Instagram
//
//  Created by Huang Yan on 11/7/22.
//

import UIKit

extension HomeViewController {
    func setNavBar() {
        setLogoButton()
        navStyle()
        navLayout()
    }
    fileprivate func setLogoButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Instagram"), style: .plain, target: self, action: #selector(didTappedLogo))
        let planeButton = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTappedPlane))
        let likeButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTappedLike))
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTappedPlus))
        let spacer = UIBarButtonItem(customView: UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))) // space out between left and right
        
        navigationItem.rightBarButtonItems = [planeButton, likeButton, plusButton, spacer]
        
    }
    fileprivate func navStyle() {
        
    }
    fileprivate func navLayout() {

    }
    @objc func didTappedLogo() {
        
    }
    @objc func didTappedPlane() {
        
    }
    @objc func didTappedLike() {
        
    }
    @objc func didTappedPlus() {
        
    }
}
