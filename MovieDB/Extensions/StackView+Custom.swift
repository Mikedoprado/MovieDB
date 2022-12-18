//
//  StackView+Custom.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import UIKit

class CustomStackView: UIStackView {
    
    init(
        arrangedSubviews: [UIView],
        spacing: CGFloat = 0,
        orientation: NSLayoutConstraint.Axis = .horizontal
    ) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = orientation
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
