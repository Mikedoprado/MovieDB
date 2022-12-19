//
//  LabelBuilder.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class LabelBuilder {

    private var label = UILabel()

    @discardableResult
    func fontStyle(textStyle: FontSize, weight: UIFont.Weight = .regular) -> LabelBuilder {
        label.font = .systemFont(ofSize: textStyle.size, weight: weight)
        label.adjustsFontSizeToFitWidth = true
        return self
    }

    @discardableResult
    func amountLines(numLines: Int) -> LabelBuilder {
        label.numberOfLines = numLines
        return self
    }

    @discardableResult
    func setColor(color: ProjectColors) -> LabelBuilder {
        label.textColor = color.color
        return self
    }

    @discardableResult
    func setText(text: String) -> LabelBuilder {
        label.text = text
        return self
    }

    @discardableResult
    func setInteraction(isInteraction: Bool) -> LabelBuilder {
        label.isUserInteractionEnabled = true
        return self
    }

    @discardableResult
    func lineBreakMode(mode: NSLineBreakMode) -> LabelBuilder {
        label.lineBreakMode = mode
        return self
    }

    @discardableResult
    func opacity(opacity: Float) -> LabelBuilder {
        label.layer.opacity = opacity
        return self
    }

    @discardableResult
    func clipToBounds() -> LabelBuilder {
        label.clipsToBounds = true
        return self
    }

    @discardableResult
    func textAlignment(align: NSTextAlignment) -> LabelBuilder {
        label.textAlignment = align
        return self
    }
    
    @discardableResult
    func isHidden(_ hidden: Bool) -> LabelBuilder {
        label.isHidden = hidden
        return self
    }

    func build() -> UILabel {
        return label
    }
}
