//
//  UINavigationController.swift
//  Instagram
//
//  Created by Huang Yan on 1/19/23.
//

import UIKit
extension UINavigationController {
    func configureBackIndicator() {
        let image = UIImage(systemName: "chevron.left")
        let appearance = UINavigationBarAppearance()
        appearance.setBackIndicatorImage(image, transitionMaskImage: image)
        UINavigationBar.appearance().standardAppearance = appearance
    }
    func setBackbuttonTitle(_ text: String) {
        navigationBar.topItem?.backButtonTitle = text
    }
}
