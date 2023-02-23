//
//  AppDelegate.swift
//  Instagram
//
//  Created by Huang Yan on 10/15/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let mainVC = MainViewController()
    
    let loginVC = LoginViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        setupDelegate()
        let loginNC = makeLoginNC()
        window?.rootViewController = loginNC
        
        return true
    }
    //MARK: - Private
    private func setupDelegate() {
        loginVC.delegate = self
    }
    private func makeLoginNC() -> IGUINavigationController {
        let nc = IGUINavigationController(rootViewController: loginVC)
        return nc
    }
}

//MARK: - Animation transition between VC
extension AppDelegate {
    func setRootVC (_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

//MARK: - LoginDelegate
extension AppDelegate: LoginDelegate {
    func didLogin() {
        setRootVC(mainVC)
    }
}
