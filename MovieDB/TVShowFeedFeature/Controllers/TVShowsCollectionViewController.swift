//
//  TVShowsCollectionView.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit
import RxCocoa
import RxSwift

final class TVShowsCollectionViewController: UIViewController {
    
    private var viewModel: TVShowCollectionViewModel
    private var disposeBag = DisposeBag()
    
    private struct K {
        static let itemHeight: CGFloat = 320
    }
    
    var collectionView: UICollectionView?

    private let itemLayoutWidth = MarginSpaces.sizeWidthScreen.space / 2.3
    
    init(viewModel: TVShowCollectionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setBinds()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }
    
    private func setBinds() {
        setCollectionView()
        guard let collection = collectionView else { return }
        let viewDidLoad = rx.sentMessage(#selector(UIViewController.viewDidLoad)).map { _ in }
        let input = TVShowCollectionViewModel.Input(viewDidLoad: viewDidLoad)
        let outputs = viewModel.transform(input: input)
        
        outputs.loadTVShows.drive(collection.rx.items(cellIdentifier: TVShowCollectionViewCell.identifier)) { (_, item, cell) in
            guard let newCell = cell as? TVShowCollectionViewCell else { return }
            newCell.viewModel = item
        }.disposed(by: disposeBag)
    }
    
    private func setUI() {
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
