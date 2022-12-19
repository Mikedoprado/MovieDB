//
//  TVShowFeedControllerViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import RxSwift
import RxCocoa

protocol TVShowFeedControllerViewModelProtocol {
    associatedtype Input
    associatedtype Output
//    func transform(input: Input) -> Output
    var pageNumber: Int { get }
}

final class TVShowFeedControllerViewModel: TVShowFeedControllerViewModelProtocol {

    private var listTVShows = [TVShowFeedViewModelProtocol]()
    private var service: TVShowService
    
    var pageNumber: Int = 1
    
    init(service: TVShowService) {
        self.service = service
    }
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let didScrollTVShows: ControlEvent<(cell: UICollectionViewCell, at: IndexPath)>
        let segmentedControlValueChange: ControlEvent<UIControl.Event>
    }
    
    struct Output {
        let loadTVShows: Driver<[TVShowFeedViewModelProtocol]>
    }
    
//    func transform(input: Input) -> Output {
//        <#code#>
//    }
}
