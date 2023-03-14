//
//  UIStackView.swift
//  Extensions
//
//  Created by BENSALAH on 14/05/2019.
//  Copyright © 2019 BENSALAH. All rights reserved.
//

import UIKit

extension UIStackView {
    // MARK: - Methods

    public func removeAllArangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
