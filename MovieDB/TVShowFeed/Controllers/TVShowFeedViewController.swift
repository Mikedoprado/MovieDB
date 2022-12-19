//
//  TVShowFeedViewController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit
import RxSwift



final class TVShowFeedViewController: UIViewController {

    private var segmentedController: UIViewController
//    private var collectionViewController: UIViewController
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        title = "TV Shows"
    }
    
    init(segmentedController: UIViewController) {
        self.segmentedController = segmentedController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
    
        view.backgroundColor = ProjectColors.almostBlack.color
        view.addSubview(scrollView)
        
        scrollView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor)
        
        [ segmentedController ].forEach { addChild($0) }
        segmentedController.didMove(toParent: self)
        
        let stackHome = CustomStackView(
            arrangedSubviews: [
                segmentedController.view
                // segmentedController and FeedController
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
    
}
