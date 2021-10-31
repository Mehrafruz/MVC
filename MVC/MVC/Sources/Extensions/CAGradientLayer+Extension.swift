//
//  CAGradientLayer+Extension.swift
//  MVC+Coordinator
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

extension CAGradientLayer {
    static func createGradient(colors: [UIColor],
                               cornerRadius: CGFloat? = nil,
                               position: GradientPosition = .leftToRight) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        
        switch position {
        case .topToBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .topLeftToBottomRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .topRightToBottomLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .leftToRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        gradientLayer.cornerRadius = cornerRadius ?? 0
        return gradientLayer
    }
    
}
