//
//  UIView+Identifier.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
