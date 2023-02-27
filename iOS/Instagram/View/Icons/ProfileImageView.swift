//
//  ProfileImageView.swift
//  Instagram
//
//  Created by Huang Yan on 10/21/22.
//

import UIKit
class ProfileImageView: UIView {
    
    private var internalUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var shapeLayer: CAShapeLayer?
    
    public var image: UIImage? {
        didSet {
            internalUIImageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Private
    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(internalUIImageView)
        
        let padding: CGFloat = 4
        NSLayoutConstraint.activate([
            internalUIImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            internalUIImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            internalUIImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            internalUIImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
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
        if let shapeLayer = shapeLayer {
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = UIColor.lightGray.cgColor
            shapeLayer.lineWidth = lineWidth
            layer.addSublayer(shapeLayer)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = layer.frame.height/2
        self.clipsToBounds = true
        shapeLayer?.removeFromSuperlayer()
        drawRingFittingInsideSquareView()
        internalUIImageView.layer.cornerRadius = internalUIImageView.frame.size.height / 2
        internalUIImageView.clipsToBounds = true
    }
}
