//
//  TVShowDetailHostingController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit
import SwiftUI

final class TVShowDetailViewModel {
    
}

class TVShowDetailHostingController: UIViewController {
    
    var viewModel: TVShowDetailViewModel?
    
    init(viewModel: TVShowDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        let tvShowDetailView = TVShowDetailView(viewModel: viewModel)
        let controller = UIHostingController(rootView: tvShowDetailView)
        self.addChild(controller)
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        controller.rootView.viewModel = viewModel
        controller.view.fillSuperview()
    }
    
}
