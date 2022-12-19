//
//  ImageBuilder.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class ImageBuilder {
    
    private var image = CacheImageView()
    
    @discardableResult
    func sizeAndAspectImage(width: CGFloat, height: CGFloat, aspectRatio: UIView.ContentMode ) -> ImageBuilder {
        image.frame = .init(x: 0, y: 0, width: width, height: height)
        image.contentMode = aspectRatio
        return self
    }
    
    @discardableResult
    func aspectImage(aspectRatio: UIView.ContentMode) -> ImageBuilder {
        image.contentMode = aspectRatio
        return self
    }
    
    @discardableResult
    func roundCorners(circle: Bool, radius: CGFloat, clipped: Bool) -> ImageBuilder {
        image.layer.cornerRadius = circle ? radius / 2 : radius
        image.clipsToBounds = clipped
        return self
    }
    
    @discardableResult
    func imageOpacity(opacity: Float) -> ImageBuilder {
        image.layer.opacity = opacity
        return self
    }
    
    @discardableResult
    func activeInteraction() -> ImageBuilder {
        image.isUserInteractionEnabled = true
        return self
    }
    
    @discardableResult
    func setBackgroundColor(color: ProjectColors) -> ImageBuilder {
        image.backgroundColor = color.color
        return self
    }
    
    @discardableResult
    func systemImage(iconName: String, color: ProjectColors?, size: CGFloat? = nil) -> ImageBuilder {
        if size != nil {
            let sizeFont = UIFont.systemFont(ofSize: size ?? 0)
            let iconSize = UIImage.SymbolConfiguration(font: sizeFont)
            self.image.image = UIImage(systemName: iconName, withConfiguration: iconSize)
        } else {
            image.image = UIImage(systemName: iconName)
        }
        if color != nil {
            image.tintColor = color?.color
        }
        return self
    }
    
    @discardableResult
    func setTinColor(color: ProjectColors) -> ImageBuilder {
        image.tintColor = color.color
        return self
    }
    
    @discardableResult
    func setImage(imageName: String) -> ImageBuilder {
        image.image = UIImage(named: imageName)
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> ImageBuilder {
        image.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func setPlaceHolder(image: UIImage?) -> ImageBuilder {
        guard let placeholder = image else { return self }
        self.image.emptyImage = placeholder
        return self
    }

    @discardableResult
    func setHeight(height: CGFloat) -> ImageBuilder {
        image.constrainHeight(constant: height)
        return self
    }
    
    func build() -> UIImageView {
        return image
    }
}
