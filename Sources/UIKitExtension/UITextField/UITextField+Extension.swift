//
//  UITextField+Extension.swift
//  Extensions
//
//  Created by Amine Bensalah on 12/06/2019.
//  Copyright © 2019 BENSALAH. All rights reserved.
//

import UIKit

extension UITextField {
    public func setBottomBorder() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0,
                                    y: frame.size.height - 1,
                                    width: frame.size.width,
                                    height: 1.0)
        bottomBorder.backgroundColor = tintColor.cgColor
        layer.addSublayer(bottomBorder)
    }
}
