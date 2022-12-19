//
//  MovieDBNavigationController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

final class MovieDBNavigationController: UINavigationController {
    init() {
        super.init(nibName: nil, bundle: nil)
        delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideNavigationBar() {
        navigationBar.backgroundColor = .clear
    }
    
    func setNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = ProjectColors.dark85.color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.tintColor = .white
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.isHidden = false
        navigationBar.overrideUserInterfaceStyle = .dark
        navigationBar.isTranslucent = false
    }

}

extension MovieDBNavigationController: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        if viewController is TVShowFeedViewController {
            setNavigationController()
        } else {
            hideNavigationBar()
        }
    }
}
