//
//  TVShowsCollectionView.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class TVShowsCollectionView: UIViewController {
    
    private struct K {
        static let itemHeight: CGFloat = 300
    }
    
    var collectionView: UICollectionView?

    private let itemLayoutWidth = MarginSpaces.sizeWidthScreen.space / 2 - (MarginSpaces.collectionViewHorizontalMargin.space * 2)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setLayoutCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: MarginSpaces.zero.space,
            left: MarginSpaces.collectionViewHorizontalMargin.space,
            bottom: MarginSpaces.zero.space,
            right: MarginSpaces.collectionViewHorizontalMargin.space)
        
        collectionView = UICollectionView(
            frame: CGRect(
                x: MarginSpaces.zero.space,
                y: MarginSpaces.zero.space,
                width: MarginSpaces.zero.space,
                height: MarginSpaces.zero.space),
            collectionViewLayout: layout)
        
        layout.itemSize = CGSize(width: itemLayoutWidth, height: K.itemHeight)
        layout.scrollDirection = .vertical
    }
    
    private func setCollectionView() {
        setLayoutCollectionView()
        collectionView?.register(
            TVShowCollectionViewCell.self,
            forCellWithReuseIdentifier: TVShowCollectionViewCell.identifier)
        collectionView?.backgroundColor = ProjectColors.almostBlack.color
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.isPagingEnabled = true
    }
    
    private func setUI() {
        setCollectionView()
        view.backgroundColor = ProjectColors.almostBlack.color
        view.clipsToBounds = true
        
        guard let collection = collectionView else { return }
        view.addSubview(collection)
        
        collection.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: .init(
                top: MarginSpaces.collectionViewHorizontalMargin.space,
                left: MarginSpaces.collectionViewHorizontalMargin.space,
                bottom: MarginSpaces.collectionViewHorizontalMargin.space,
                right: MarginSpaces.collectionViewHorizontalMargin.space))
    }
    
}
