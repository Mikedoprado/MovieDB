//
//  TVShowDetailHostingController.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit
import SwiftUI

class TVShowDetailHostingController: UIViewController {
    
    var tvShowDetailViewModel: TVShowDetailViewModel
    let tvShowCastViewModel: TVShowCastViewModel
    
    init(
        tvShowDetailViewModel: TVShowDetailViewModel,
        tvShowCastViewModel:TVShowCastViewModel
    ) {
        self.tvShowDetailViewModel = tvShowDetailViewModel
        self.tvShowCastViewModel = tvShowCastViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSwiftUIViewOnController()
    }
    
    func setSwiftUIViewOnController(){
        let tvShowDetailView = TVShowDetailView(
            detailsViewModel: self.tvShowDetailViewModel,
            castViewModel: self.tvShowCastViewModel)
        let controller = UIHostingController(rootView: tvShowDetailView)
        self.addChild(controller)
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        controller.view.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: .init(top: -100, left: 0, bottom: 0, right: 0))
    }
    
}
