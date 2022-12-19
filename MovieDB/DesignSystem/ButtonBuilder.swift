//
//  ButtonBuilder.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class ButtonBuilder {

    private var button = UIButton()

    @discardableResult
    func setColor(color: ProjectColors) -> ButtonBuilder {
        button.setTitleColor(color.color, for: .normal)
        return self
    }
    
    @discardableResult
    func setTitleAndColor(title: String, color: ProjectColors) -> ButtonBuilder {
        button.setTitle(title, for: .normal)
        button.setTitleColor(color.color, for: .normal)
        return self
    }
    
    @discardableResult
    func setBorder(color: ProjectColors, width: CGFloat) -> ButtonBuilder {
        button.layer.borderColor = color.color.cgColor
        button.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    func setCornerRadius(radius: CGFloat) -> ButtonBuilder {
        button.layer.cornerRadius = radius
        return self
    }

    @discardableResult
    func setSystemImage(
        named name: String,
        of style: FontSize,
        allStates: Bool = false
    ) -> ButtonBuilder {
        let imageFont = UIFont.systemFont(ofSize: style.size)
        let configuration = UIImage.SymbolConfiguration(font: imageFont)
        let image = UIImage(systemName: name, withConfiguration: configuration)
        
        setImage(image, on: allStates)
        
        return self
    }
        
    private func setImage(_ image: UIImage?, on allStates: Bool) {
        button.setImage(image, for: .normal)
        
        if allStates {
            button.setImage(image, for: .selected)
            button.setImage(image, for: .focused)
            button.setImage(image, for: .highlighted)
        }
    }
        
    @discardableResult
    func setImage(named name: String, allStates: Bool = false) -> ButtonBuilder {
        let image = UIImage(named: name)
        setImage(image, on: allStates)
        
        return self
    }
    
    @discardableResult
    func setTintColor(color: ProjectColors) -> ButtonBuilder {
        button.tintColor = color.color
        return self
    }
    
    @discardableResult
    func setImage(fromIcon icon: Icons) -> ButtonBuilder {
        button.setImage(UIImage(named: icon.systemIcon), for: .normal)
        return self
    }
    
    @discardableResult
    func addEdgeInsetToImage(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> ButtonBuilder {
        button.imageEdgeInsets = .init(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    func setContentMode(mode: UIView.ContentMode) -> ButtonBuilder {
        button.contentMode = mode
        return self
    }
    
    @discardableResult
    func setBackgroundColor(color: ProjectColors) -> ButtonBuilder {
        button.backgroundColor = color.color
        return self
    }
    
    @discardableResult
    func fontStyle(textStyle: TextStyle, weight: UIFont.Weight = .regular) -> ButtonBuilder {
        button.titleLabel?.font = .systemFont(ofSize: textStyle.size, weight: weight)
        return self
    }
    
    @discardableResult
    func isHidden(_ hidden: Bool) -> ButtonBuilder {
        button.isHidden = hidden
        return self
    }
    
    @discardableResult
    func setHeight(height: CGFloat) -> ButtonBuilder {
        button.constrainHeight(constant: height)
        return self
    }

    @discardableResult
    func setWidth(_ width: CGFloat) -> ButtonBuilder {
        button.constrainWidth(constant: width)
        return self
    }
    
    @discardableResult
    func setHeightAndWidth(height: CGFloat, width: CGFloat) -> ButtonBuilder {
        setHeight(height: height)
        setWidth(width)
        return self
    }
    
    @discardableResult
    func setTag(tag: Int) -> ButtonBuilder {
        button.tag = tag
        return self
    }
    
    func build() -> UIButton {
        return button
    }
}
