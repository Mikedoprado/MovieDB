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
    
    private var service: TVShowListService
    var section = BehaviorRelay<Int>(value: 1)
    private var listTVShows = [TVShowFeedCellViewModel]()
    
    var currentTVShowItems: Int {
        listTVShows.count
    }
    
    init(service: TVShowListService) {
        self.service = service
    }
    
    enum State {
        case waiting
        case loading
    }
    
    struct Input {
        let viewDidLoad: Driver<Void>
        let didScrollTVShows: Driver<State>
    }
    
    struct Output {
        let loadTVShows: Driver<[TVShowFeedCellViewModel]>
    }
    
    func deliverListViewModels(page: Int) -> Driver<[TVShowFeedCellViewModel]> {
        return getItemsFromService(page: page)
            .map { [weak self] shows in
                let tvShows = shows.map { TVShowFeedCellViewModel(tvShow: $0)}
                self?.updateStateandIncrementList(tvShow: tvShows)
                return tvShows
            }
            .asDriver(onErrorJustReturn: [])
    }
    
    func getItemsFromService(page: Int) -> PrimitiveSequence<SingleTrait, [TVShow]> {
        return service
            .getItems(page: page)
            .map { $0.results }
    }
    
    func updateStateandIncrementList(tvShow: [TVShowFeedCellViewModel]) {
        listTVShows.append(contentsOf: tvShow)
    }
    
    func incrementPage() {
        section.accept(section.value + 1)
    }

    func transform(input: Input) -> Output {
        let viewDidLoad = input.viewDidLoad

        let loadShows = viewDidLoad
            .withLatestFrom(section.asDriver())
            .flatMap { [weak self] page -> Driver<[TVShowFeedCellViewModel]> in
                guard let self = self else { return Driver.empty() }
                return self.deliverListViewModels(page: page)
            }
        
        let checkingState = input.didScrollTVShows
            .filter { $0 == .loading }
            .map { [weak self] _ in
                self?.incrementPage()
            }
        
        let addingShowForPagination = checkingState
            .withLatestFrom(section.asDriver())
            .flatMap { [weak self] page -> Driver<[TVShowFeedCellViewModel]> in
                guard let self = self else { return Driver.empty() }
                return self.deliverListViewModels(page: page)
                    .map { _ in self.listTVShows }
            }
            
  
        let allTVShow = Driver.merge(loadShows, addingShowForPagination)

        return Output(loadTVShows: allTVShow)
    }
}
