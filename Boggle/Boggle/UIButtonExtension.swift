//
//  UIColorButtonExtension.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            setBackgroundImage(colorImage, for: state)
        }
    }
}
