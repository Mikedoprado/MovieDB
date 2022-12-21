//
//  TVShowDetailHostingController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit
import SwiftUI

final class TVShowDetailViewModel {
    
//    var service: TVShowService<TVShowDetails>
//    var id: Int
//    var detailsTVShow: TVShowDetails?
//    
//    init(service: TVShowService<TVShowDetails>, id: Int) {
//        self.service = service
//        self.id = id
//    }
//    
//    private func getDetailsTvShow() {}
}

class TVShowDetailHostingController: UIViewController {
    
    var viewModel: TVShowDetailViewModel
    
    init(viewModel: TVShowDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setSwiftUIViewOnController(){
        let tvShowDetailView = TVShowDetailView()
        let controller = UIHostingController(rootView: tvShowDetailView)
        self.addChild(controller)
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        controller.view.fillSuperview()
    }
    
}
