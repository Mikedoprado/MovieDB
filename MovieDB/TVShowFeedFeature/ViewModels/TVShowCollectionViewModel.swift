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
    func transform(input: Input) -> Output
    var pageNumber: Int { get }
}

final class TVShowCollectionViewModel: TVShowFeedControllerViewModelProtocol {

    private var listTVShows = [TVShowFeedViewModelProtocol]()
    private var service: TVShowService<TVShowList>
    var section = BehaviorRelay<TVShowsFeed>(value: .popular)
    
    var pageNumber: Int = 1
    
    init(service: TVShowService<TVShowList>) {
        self.service = service
    }
    
    struct Input {
        let viewDidLoad: Observable<Void>
//        let didScrollTVShows: ControlEvent<(cell: UICollectionViewCell, at: IndexPath)>
    }
    
    struct Output {
        let loadTVShows: Driver<[TVShowFeedCellViewModel]>
    }
    
    func deliverListViewModels(endpoint: Endpoint, page: Int) -> Driver<[TVShowFeedCellViewModel]> {
        print("deliver")
        return getItemsFromService(endpoint: endpoint, page: page)
            .map { $0.map { TVShowFeedCellViewModel(tvShow: $0)} }
            .asDriver(onErrorJustReturn: [])
    }
    
    func getItemsFromService(endpoint: Endpoint, page: Int) -> PrimitiveSequence<SingleTrait, [TVShow]> {
        print("service")
        return service
            .getItems(endpoint: endpoint, page: page)
            .map { $0.results }
    }
    
    func transform(input: Input) -> Output {
        let viewDidLoad = input.viewDidLoad.asDriver(onErrorJustReturn: ())

        let loadShows = viewDidLoad
            .withLatestFrom(section.asDriver())
            .compactMap { [weak self] tvShowFeed in
                self?.deliverListViewModels(endpoint: tvShowFeed, page: 1)
            }
            .flatMap { $0.map { $0 } }
            .asDriver(onErrorJustReturn: [])


        return Output(loadTVShows: loadShows )
    }
}
