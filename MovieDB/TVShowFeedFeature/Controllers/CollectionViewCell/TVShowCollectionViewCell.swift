//
//  TVShowCollectionViewCell.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class TVShowCollectionViewCell: UICollectionViewCell {
    
    private struct K {
        static let placeHolder: String = "notFoundImage"
        static let titleLines: Int = 2
        static let defaultNumberLines: Int = 1
        static let overviewLines: Int = 4
        static let iconSize: CGFloat = 10
        static let posterHeight: CGFloat = 200
    }
    
    var viewModel: TVShowFeedViewModelProtocol? {
        didSet {
            setUI()
        }
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
        .sizeAndAspectImage(width: 16, height: 16, aspectRatio: .scaleAspectFit)
        .systemImage(iconName: Icons.star.systemIcon, color: .algaeGreen, size: K.iconSize)
        .build()
    
    private var overview = LabelBuilder()
        .amountLines(numLines: K.overviewLines)
        .fontStyle(textStyle: .bodyCell)
        .setColor(color: .white)
        .clipToBounds()
        .build()
    
    private func setData() {
        tvShowTitle.text = viewModel?.name
        tvShowDate.text = viewModel?.date
        overview.text = viewModel?.overview
        popularity.text = viewModel?.voteAverage
        poster.loadImage(urlString: viewModel?.poster)
    }
    
    private func setUI() {
        setData()
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
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
        
        let stackViewRating = CustomStackView(arrangedSubviews: [UIView(), starIcon, popularity], spacing: 5, orientation: .horizontal)
        
        let stackDatePopularity = CustomStackView(
            arrangedSubviews: [tvShowDate, UIView(), stackViewRating], orientation: .horizontal)
        stackDatePopularity.distribution = .fillProportionally
        stackDatePopularity.alignment = .center
        
        contentView.addSubview(stackDatePopularity)
        
        stackDatePopularity.anchor(
            top: tvShowTitle.bottomAnchor,
            leading: contentView.leadingAnchor,
            bottom: nil,
            trailing: contentView.trailingAnchor,
            padding: .init(
                top: MarginSpaces.collectionViewVerticalMargin.space,
                left: MarginSpaces.horizontalCellMargin.space,
                bottom: MarginSpaces.zero.space,
                right: MarginSpaces.horizontalCellMargin.space))
        
        overview.anchor(
            top: stackDatePopularity.bottomAnchor,
            leading: contentView.leadingAnchor,
            bottom: nil,
            trailing: contentView.trailingAnchor,
            padding: .init(
                top: MarginSpaces.collectionViewVerticalMargin.space,
                left: MarginSpaces.horizontalCellMargin.space,
                bottom: MarginSpaces.zero.space,
                right: MarginSpaces.horizontalCellMargin.space))
    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
      poster.image = nil
    }
   
}