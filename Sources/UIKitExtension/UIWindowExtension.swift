//
//  MainWindow.swift
//  Binders
//
//  Created by BENSALAH on 10/04/2019.
//  Copyright © 2019 BENSALAH. All rights reserved.
//

import UIKit

extension UIWindow {
    public func reload() {
        subviews.forEach { view in
            view.removeFromSuperview()
            addSubview(view)
        }
    }
}

extension Array where Element == UIWindow {
    public func reload() {
        forEach { $0.reload() }
    }
}
