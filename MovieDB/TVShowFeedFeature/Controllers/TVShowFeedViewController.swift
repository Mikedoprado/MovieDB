//
//  TVShowFeedViewController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit
import RxSwift
import Combine

final class TVShowFeedViewController: UIViewController {

    private var disposeBag = DisposeBag()
    private var cancellable = Set<AnyCancellable>()
    
    var detailNavigation: DetailNavigation
    
    private struct K {
        static let navigationTitle: String = "TV Shows"
    }

    private var segmentedController: CategoriesSegmentedController
    private var popularCollectionViewController: TVShowsCollectionViewController
    private var topRatedCollectionViewController: TVShowsCollectionViewController
    private var onTvCollectionViewController: TVShowsCollectionViewController
    private var airingTodayCollectionViewController: TVShowsCollectionViewController
    private var stackCollectionView = UIStackView()
    
    private let buttonMenu = ButtonBuilder()
        .setTintColor(color: .white)
        .setSystemImage(named: Icons.menu.systemIcon, of: .headline, allStates: true)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setBindSegmentedController()
        setNavigation()
        title = K.navigationTitle
    }
    
    init(
        segmentedController: CategoriesSegmentedController,
        popularCollectionViewController: TVShowsCollectionViewController,
        topRatedCollectionViewController: TVShowsCollectionViewController,
        onTvCollectionViewController: TVShowsCollectionViewController,
        airingTodayCollectionViewController: TVShowsCollectionViewController,
        detailNavigationController: DetailNavigation
    ) {
        self.segmentedController = segmentedController
        self.popularCollectionViewController = popularCollectionViewController
        self.topRatedCollectionViewController = topRatedCollectionViewController
        self.onTvCollectionViewController = onTvCollectionViewController
        self.airingTodayCollectionViewController = airingTodayCollectionViewController
        self.detailNavigation = detailNavigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBindSegmentedController() {
        segmentedController.segmentedControl.rx.selectedSegmentIndex.subscribe(onNext: { [weak self] index in
            guard let self = self else { return }
            switch index {
            case 0:
                self.addOrRemoveView(addView: self.popularCollectionViewController.view)
            case 1:
                self.addOrRemoveView(addView: self.topRatedCollectionViewController.view)
            case 2:
                self.addOrRemoveView(addView: self.onTvCollectionViewController.view)
            case 3:
                self.addOrRemoveView(addView: self.airingTodayCollectionViewController.view)
            default:
                self.addOrRemoveView(addView: self.popularCollectionViewController.view)
            }
            
        }).disposed(by: disposeBag)
    }
    
    func addOrRemoveView(addView: UIView) {
        toggleView(view: stackCollectionView.arrangedSubviews[0], inStackView: stackCollectionView, show: false)
        toggleView(view: addView, inStackView: stackCollectionView, show: true)
        view.layoutIfNeeded()
    }
    
    func toggleView(view: UIView, inStackView stackView: UIStackView, show: Bool) {
        if show {
            stackView.addArrangedSubview(view)
        } else {
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    private func setUI() {
        setupNavigationButtons()
        view.backgroundColor = ProjectColors.almostBlack.color

        view.addSubview(segmentedController.view)
        segmentedController.view.constrainHeight(constant: 50)
        
        segmentedController.view.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: nil,
            trailing: view.trailingAnchor)
        
        stackCollectionView.addSubview(popularCollectionViewController.view)
        
        stackCollectionView = CustomStackView(
            arrangedSubviews: [
                popularCollectionViewController.view], orientation: .vertical)
        
        view.addSubview(stackCollectionView)
        stackCollectionView
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
        
        [ segmentedController,
          popularCollectionViewController,
          topRatedCollectionViewController,
          onTvCollectionViewController,
          airingTodayCollectionViewController
        ].forEach {
            addChild($0)
            $0.didMove(toParent: self)
        }

    }
    
    private func setupNavigationButtons() {
        let rightBarButtonMenu = UIBarButtonItem(customView: buttonMenu)
        navigationItem.rightBarButtonItems = [rightBarButtonMenu]
    }
    
}

extension TVShowFeedViewController {
    func setNavigation() {
        popularCollectionViewController.navigationAction = { [weak self] id in
            guard let self = self else { return }
            self.detailNavigation.navigateToDetailTVShowView(id: id)
        }
        topRatedCollectionViewController.navigationAction = { id in
            print(id)
        }
        onTvCollectionViewController.navigationAction = { id in
            print(id)
        }
        airingTodayCollectionViewController.navigationAction = { id in
            print(id)
        }
    }
}
