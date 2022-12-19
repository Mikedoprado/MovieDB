//
//  TVShowFeedViewController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit
import RxSwift

final class TVShowFeedViewController: UIViewController {
    
    private struct K {
        static let navigationTitle: String = "TV Shows"
    }

    private var segmentedController: CategoriesSegmentedController
    private var collectionViewController: TVShowsCollectionView
    private let scrollView = UIScrollView()
    
    let buttonMenu = ButtonBuilder()
        .setTintColor(color: .white)
        .setSystemImage(named: Icons.menu.systemIcon, of: .headline, allStates: true)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        title = K.navigationTitle
    }
    
    init(segmentedController: CategoriesSegmentedController, collectionViewController: TVShowsCollectionView) {
        self.segmentedController = segmentedController
        self.collectionViewController = collectionViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        setupNavigationButtons()
        view.backgroundColor = ProjectColors.almostBlack.color
        view.addSubview(scrollView)
        
        scrollView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor)
        
        [ segmentedController, collectionViewController ].forEach { addChild($0) }
        segmentedController.didMove(toParent: self)
        collectionViewController.didMove(toParent: self)
        
        let stackHome = CustomStackView(
            arrangedSubviews: [
                segmentedController.view,
                collectionViewController.view
            ], spacing: 14, orientation: .vertical)
        
        stackHome.constrainWidth(constant: MarginSpaces.sizeWidthScreen.space - (MarginSpaces.horizontalMargin.space))
        
        scrollView.addSubview(stackHome)
        
        stackHome
            .anchor(
                top: scrollView.topAnchor,
                leading: scrollView.leadingAnchor,
                bottom: scrollView.bottomAnchor,
                trailing: scrollView.trailingAnchor,
                padding: .init(
                    top: MarginSpaces.collectionViewHorizontalMargin.space,
                    left: MarginSpaces.collectionViewHorizontalMargin.space,
                    bottom: MarginSpaces.zero.space,
                    right: MarginSpaces.collectionViewHorizontalMargin.space))

    }
    
    private func setupNavigationButtons() {
        let rightBarButtonMenu = UIBarButtonItem(customView: buttonMenu)
        navigationItem.rightBarButtonItems = [rightBarButtonMenu]
    }
    
}
