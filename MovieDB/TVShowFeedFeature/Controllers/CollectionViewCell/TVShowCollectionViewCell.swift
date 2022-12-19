//
//  TVShowCollectionViewCell.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class TVShowFeedCellViewModel {
    
}

final class TVShowCollectionViewCell: UICollectionViewCell {
    
    private struct K {
        static let placeHolder: String = "notFoundImage"
        static let titleLines: Int = 2
        static let defaultNumberLines: Int = 1
        static let overviewLines: Int = 4
        static let iconSize: CGFloat = 16
        static let posterHeight: CGFloat = 230
    }
    
    var viewModel: TVShowFeedCellViewModel? {
        didSet {
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var poster = ImageBuilder()
        .aspectImage(aspectRatio: .scaleAspectFill)
        .setBackgroundColor(color: .transparentWhite)
        .setPlaceHolder(image: UIImage(named: K.placeHolder))
        .build()
    
    private var tvShowTitle = LabelBuilder()
        .amountLines(numLines: K.titleLines)
        .fontStyle(textStyle: .title, weight: .semibold)
        .setColor(color: .algaeGreen)
        .build()
    
    private var tvShowDate = LabelBuilder()
        .amountLines(numLines: K.defaultNumberLines)
        .fontStyle(textStyle: .date)
        .setColor(color: .algaeGreen)
        .build()
    
    private var popularity = LabelBuilder()
        .amountLines(numLines: K.defaultNumberLines)
        .fontStyle(textStyle: .date)
        .setColor(color: .algaeGreen)
        .build()
    
    private var starIcon = ImageBuilder()
        .systemImage(iconName: Icons.star.systemIcon, color: .algaeGreen, size: K.iconSize)
        .build()
    
    private var overview = LabelBuilder()
        .amountLines(numLines: K.overviewLines)
        .fontStyle(textStyle: .bodyCell)
        .setColor(color: .white)
        .clipToBounds()
        .build()
    
    func setUI() {
        [poster, tvShowTitle, overview].forEach { [weak self] in
            self?.contentView.addSubview($0)
        }
        
        poster.constrainHeight(constant: K.posterHeight)
        
        poster.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: nil,
            trailing: contentView.trailingAnchor)
        
        tvShowTitle.anchor(
            top: poster.bottomAnchor,
            leading: contentView.leadingAnchor,
            bottom: nil,
            trailing: contentView.trailingAnchor,
            padding: .init(
                top: MarginSpaces.collectionViewVerticalMargin.space,
                left: MarginSpaces.horizontalCellMargin.space,
                bottom: MarginSpaces.zero.space,
                right: MarginSpaces.zero.space))
        
        let stackDatePopularity = CustomStackView(
            arrangedSubviews: [tvShowDate, UIView(), popularity], orientation: .horizontal)
        
        contentView.addSubview(stackDatePopularity)
        
        [stackDatePopularity, overview].forEach {
            $0.anchor(
                top: tvShowTitle.bottomAnchor,
                leading: contentView.leadingAnchor,
                bottom: nil,
                trailing: contentView.trailingAnchor,
                padding: .init(
                    top: MarginSpaces.collectionViewVerticalMargin.space,
                    left: MarginSpaces.horizontalCellMargin.space,
                    bottom: MarginSpaces.zero.space,
                    right: MarginSpaces.horizontalCellMargin.space))
        }
    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
      poster.image = nil
    }
   
}
