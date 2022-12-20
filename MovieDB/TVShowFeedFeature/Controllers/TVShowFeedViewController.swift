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
    private var collectionViewController: TVShowsCollectionViewController
    
    let buttonMenu = ButtonBuilder()
        .setTintColor(color: .white)
        .setSystemImage(named: Icons.menu.systemIcon, of: .headline, allStates: true)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        title = K.navigationTitle
    }
    
    init(segmentedController: CategoriesSegmentedController, collectionViewController: TVShowsCollectionViewController) {
        self.segmentedController = segmentedController
        self.collectionViewController = collectionViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        setupNavigationButtons()
        view.backgroundColor = ProjectColors.almostBlack.color

        view.addSubview(segmentedController.view)
        view.addSubview(collectionViewController.view)
        segmentedController.view.constrainHeight(constant: 50)
        
        segmentedController.view.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: nil,
            trailing: view.trailingAnchor)
        
        collectionViewController.view
            .anchor(
                top: segmentedController.view.bottomAnchor,
                leading: view.leadingAnchor,
                bottom: view.bottomAnchor,
                trailing: view.trailingAnchor,
                padding: .init(
                    top: MarginSpaces.collectionViewHorizontalMargin.space,
                    left: MarginSpaces.zero.space,
                    bottom: MarginSpaces.zero.space,
                    right: MarginSpaces.zero.space))
        
        [ segmentedController, collectionViewController ].forEach { addChild($0) }
        segmentedController.didMove(toParent: self)
        collectionViewController.didMove(toParent: self)

    }
    
    private func setupNavigationButtons() {
        let rightBarButtonMenu = UIBarButtonItem(customView: buttonMenu)
        navigationItem.rightBarButtonItems = [rightBarButtonMenu]
    }
    
}
