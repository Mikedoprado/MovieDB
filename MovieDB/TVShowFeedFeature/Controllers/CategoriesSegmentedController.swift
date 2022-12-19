//
//  CategoriesSegmentedController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class CategoriesSegmentedController: UIViewController {
    
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: createCategories())
        view.backgroundColor = ProjectColors.battleshipGrey12.color
        view.tintColor = ProjectColors.segmentedLinesColor.color
        view.selectedSegmentTintColor = ProjectColors.slateGrey.color
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .focused)
        view.selectedSegmentIndex = 0
        return view
    }()
    
    private func createCategories() -> [String] {
        return TVShowsFeed.allCases.map { $0.title }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.addSubview(segmentedControl)
        segmentedControl
            .anchor(
                top: view.topAnchor,
                leading: view.leadingAnchor,
                bottom: view.bottomAnchor,
                trailing: view.trailingAnchor,
                padding: .init(
                    top: 14,
                    left: MarginSpaces.verticalMargin.space,
                    bottom: 14,
                    right: MarginSpaces.verticalMargin.space))
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
