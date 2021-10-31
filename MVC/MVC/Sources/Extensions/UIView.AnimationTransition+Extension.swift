//
//  UIView.AnimationTransition+Extension.swift
//  MVC+Coordinator
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

extension UIView.AnimationTransition {
    static func transitionChangeTextColor(label: UILabel, color: UIColor, duration: Double? = nil) {
        UIView.transition(with: label,
                          duration: duration == nil ? 0.3 : duration ?? 0.3,
                          options: .transitionCrossDissolve,
                          animations: { label.textColor = color},
                          completion: nil)
    }
    
    static func transitionChangeImageInImageView(imageView: UIImageView, image: UIImage, duration: Double = 0.3) {
        UIView.transition(with: imageView,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: { imageView.image = image },
                          completion: nil)
    }
    
}
