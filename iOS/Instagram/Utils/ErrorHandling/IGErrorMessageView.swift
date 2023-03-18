//
//  IGErrorMessageView.swift
//  Instagram
//
//  Created by Huang Yan on 3/17/23.
//

import UIKit

final class IGErrorMessageView: UIView {
    
    private lazy var messageText: UITextView = {
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
    
    private init(frame: CGRect, message: String) {
        super.init(frame: frame)
        messageText.text = message
        layout()
        show()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func layout() {
        layer.cornerRadius = 10
        backgroundColor = .black
        alpha = 0.5
        
        addSubviews(messageText)
        
        NSLayoutConstraint.activate([
            messageText.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageText.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageText.widthAnchor.constraint(equalTo: widthAnchor),
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
        let targetPoint = CGPoint(x: window.center.x, y: window.center.y * 0.4)
        self.center = targetPoint
        window.addSubview(self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 0.5) {
                self.alpha = 0
            } completion: { _ in
                self.removeFromSuperview()
            }
        }
    }
    
    //MARK: - Error handling instance
    @discardableResult
    public static func customized(message: String, width: CGFloat, height: CGFloat) -> IGErrorMessageView {
        return IGErrorMessageView(frame: CGRect(x: 0, y: 0, width: width, height: height), message: message)
    }
    
    @discardableResult
    public static func noInternet() -> IGErrorMessageView {
        return IGErrorMessageView(frame: CGRect(x: 0, y: 0, width: 150, height: 50), message: "No Internet Availiable")
    }
    
    deinit {
        print("ErrorMessageView Deallocated")
    }
}
