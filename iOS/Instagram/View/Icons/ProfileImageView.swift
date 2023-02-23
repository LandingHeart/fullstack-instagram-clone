//
//  ProfileImageView.swift
//  Instagram
//
//  Created by Huang Yan on 10/21/22.
//

import UIKit
class ProfileImageView: UIView {
    var internalUIImageView: UIImageView?
    var shapeLayer: CAShapeLayer?
    var image: UIImage? {
        didSet {
            setupView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        internalUIImageView = UIImageView()
        guard let innerView = internalUIImageView else { return }
        addSubview(innerView)
        let padding: CGFloat = 4
        innerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            innerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            innerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            innerView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            innerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
        innerView.image = image
        shapeLayer = CAShapeLayer()
    }
    override func draw(_ rect: CGRect) {
        drawRingFittingInsideSquareView()
    }
    internal func drawRingFittingInsideSquareView() {
        let midPoint: CGFloat = bounds.size.width/2
        let lineWidth: CGFloat =  2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: midPoint, y: midPoint),
                                      radius: CGFloat(midPoint-(lineWidth/2)),
                                      startAngle: CGFloat(0),
                                      endAngle: CGFloat(Double.pi*2),
                                      clockwise: false)
        if let sl = shapeLayer {
            sl.path = circlePath.cgPath
            sl.fillColor = UIColor.clear.cgColor
            sl.strokeColor = UIColor.lightGray.cgColor
            sl.lineWidth = lineWidth
            layer.addSublayer(sl)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = layer.frame.height/2
        self.clipsToBounds = true
        shapeLayer?.removeFromSuperlayer()
        drawRingFittingInsideSquareView()
        guard let imageView = self.internalUIImageView else {return}
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
    }
}
