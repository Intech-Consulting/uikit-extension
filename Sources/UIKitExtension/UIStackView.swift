//
//  UIStackView.swift
//  Extensions
//
//  Created by BENSALA on 14/05/2019.
//  Copyright © 2019 BENSALA. All rights reserved.
//

import UIKit

extension UIStackView {
    // MARK: - Methods

    public func removeAllArangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
