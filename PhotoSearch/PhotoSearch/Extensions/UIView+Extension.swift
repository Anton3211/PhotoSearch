//
//  UIView+Extension.swift
//  PhotoSearch
//
//  Created by Anton on 15.02.2022.
//

import Foundation
import UIKit

extension UIView {
  @IBInspectable  var cornerRadius:CGFloat {
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
