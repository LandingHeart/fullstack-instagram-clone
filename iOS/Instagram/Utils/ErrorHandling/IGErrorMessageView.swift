//
//  IGErrorMessageView.swift
//  Instagram
//
//  Created by Huang Yan on 3/17/23.
//

import UIKit

final class IGErrorMessageView: UIView {
    
    private lazy var warningImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "exclamationmark.circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemBackground
        return imageView
    }()
    
    private lazy var messageTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.font = .systemFont(ofSize: K.defaultFontSize - 4, weight: .semibold)
        textView.textColor = .systemBackground
        textView.textAlignment = .center
        textView.backgroundColor = UIColor(white: 1, alpha: 0)
        return textView
    }()
    
    @discardableResult
    private init(message: String) {
        super.init(frame: .init(x: 0, y: 0, width: K.screenWidth * 0.8, height: 50))
        messageTextView.text = message
        layout()
        show()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func layout() {
        layer.cornerRadius = 10
        backgroundColor = .black
        alpha = 0
        
        addSubviews(warningImageView, messageTextView)
        
        NSLayoutConstraint.activate([
            warningImageView.heightAnchor.constraint(equalToConstant: 40),
            warningImageView.widthAnchor.constraint(equalToConstant: 40),
            warningImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            warningImageView.leftAnchor.constraint(equalToSystemSpacingAfter: leftAnchor, multiplier: 1),
            
            messageTextView.leftAnchor.constraint(equalTo: warningImageView.leftAnchor),
            messageTextView.rightAnchor.constraint(equalTo: rightAnchor),
            messageTextView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func show() {
        guard let window = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive})
            .first(where: {$0 is UIWindowScene})
            .flatMap({ $0 as? UIWindowScene})?.windows
            .first else {
            return
        }
        self.center = CGPoint(x: window.center.x, y: K.screenHeight)
        window.addSubview(self)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [weak self] in
            self?.center.y -= 130
            self?.alpha = 0.6
            self?.warningImageView.alpha = 1
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                UIView.animate(withDuration: 0.3) {
                    self?.center.y += 130
                    self?.alpha = 0
                } completion: { _ in
                    self?.removeFromSuperview()
                }
            }
        }
    }
    
    //MARK: - Error handling instance
    public static func customized(message: String) {
        DispatchQueue.main.async {
            IGErrorMessageView(message: message)
        }
    }
    
    public static func noInternet() {
        DispatchQueue.main.async {
            IGErrorMessageView(message: "No Internet Availiable")
        }
    }
    
    deinit {
        print("ErrorMessageView Deallocated")
    }
}
