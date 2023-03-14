//
//  File.swift
//  Extensions
//
//  Created by BENSALAH on 25/04/2019.
//  Copyright © 2019 BENSALAH. All rights reserved.
//

import UIKit

extension UIAppearance {
    @discardableResult
    public func style(_ styleClosure: (Self) -> Swift.Void) -> Self {
        styleClosure(self)
        return self
    }
}
