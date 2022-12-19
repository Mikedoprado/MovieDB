//
//  UIView+Loading.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

extension UIView {

  func showLoading(view: inout UIActivityIndicatorView) {
    addSubview(view)
    view.centerYInSuperview()
    view.centerXInSuperview()
    view.startAnimating()
  }
  
  func stopLoading(view: inout UIActivityIndicatorView) {
    view.stopAnimating()
    view.removeFromSuperview()
  }
  
}
