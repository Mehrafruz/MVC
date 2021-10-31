//
//  UIView+Extension.swift
//  MVC+Coordinator
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

enum GradientPosition {
    case topToBottom
    case leftToRight
    case topLeftToBottomRight
    case topRightToBottomLeft
}

extension UIView {
    
    func applyShadow(shadowOffSet: CGSize = CGSize(width: 0, height: 0), shadowOpacity: Float = 12, shadowRadius: CGFloat = 12, color: UIColor = .blue.withAlphaComponent(0.18)) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowOffset = shadowOffSet
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    func applyGradient(colors: [UIColor],
                       cornerRadius: CGFloat? = nil,
                       position: GradientPosition = .leftToRight) {
        
        if let _ = layer.sublayers?.first as? CAGradientLayer {
            layer.sublayers?.first?.removeFromSuperlayer()
        }
        
        let gradientLayer = CAGradientLayer.createGradient(colors: colors,
                                                           cornerRadius: cornerRadius == nil ? self.layer.cornerRadius : cornerRadius,
                                                           position: position)
        
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

