//
//  RoundImageView.swift
//  CloudIMTest
//
//  Created by 沈韶泓 on 2016/12/7.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = (cornerRadius > 0)
            
//            MasksToBounds is the function of the CALayer class; clipsToBounds is the function of the UIView class and will eventually call the masksToBounds method. So use masksToBounds to conserve resources a little.
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

}
