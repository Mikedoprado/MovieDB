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
}

final class TVShowCollectionViewModel: TVShowFeedControllerViewModelProtocol {
    
    var listTVShows = [TVShowFeedViewModelProtocol]()
    private var service: TVShowService<TVShowList>
    var section = BehaviorRelay<(category:TVShowsFeed, page: Int)>(value: (category: .popular, page: 1))
    var listTVShowsPublisher = BehaviorRelay<[TVShowFeedViewModelProtocol]>(value: [])
    var state = BehaviorRelay<State>(value: .waiting)
    
    init(service: TVShowService<TVShowList>, category: TVShowsFeed) {
        self.service = service
        self.section.accept((category: category, page: 1))
    }
    
    enum State {
        case waiting
        case loading
    }
    
    struct Input {
        let viewDidLoad: Observable<Void>
        let didScrollTVShows: ControlEvent<Bool>
    }
    
    struct Output {
        let loadTVShows: Driver<[TVShowFeedCellViewModel]>
    }
    
    func deliverListViewModels(endpoint: Endpoint, page: Int) -> Driver<[TVShowFeedCellViewModel]> {
        return getItemsFromService(endpoint: endpoint, page: page)
            .map { [weak self] shows in
                self?.incrementPage()
                let tvShows = shows.map { TVShowFeedCellViewModel(tvShow: $0)}
                self?.updateStateandIncrementList(tvShow: tvShows)
                return tvShows
            }
            .asDriver(onErrorJustReturn: [])
    }
    
    func updateStateandIncrementList(tvShow: [TVShowFeedCellViewModel]) {
        listTVShowsPublisher.accept(listTVShowsPublisher.value + tvShow)
        state.accept(.waiting)
    }
    
    func incrementPage() {
        section.accept((category: section.value.category, page: section.value.page + 1))
    }

    func getItemsFromService(endpoint: Endpoint, page: Int) -> PrimitiveSequence<SingleTrait, [TVShow]> {
        return service
            .getItems(endpoint: endpoint, page: page)
            .map { $0.results }
    }
    
    func transform(input: Input) -> Output {
        let viewDidLoad = input.viewDidLoad.asDriver(onErrorJustReturn: ())

        let loadShows = viewDidLoad
            .withLatestFrom(section.asDriver())
            .compactMap { [weak self] tvShowFeed in
                self?.deliverListViewModels(endpoint: tvShowFeed.category, page: tvShowFeed.page)
            }
            .flatMap { $0.map { $0 } }
            .asDriver(onErrorJustReturn: [])

        return Output(loadTVShows: loadShows)
    }
}
