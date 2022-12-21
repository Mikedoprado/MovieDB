//
//  TVShowCollectionViewModelTest.swift
//  MovieDBTests
//
//  Created by Michael Conchado on 20/12/22.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import RxBlocking
@testable import MovieDB

final class TVShowCollectionViewModelTest: XCTestCase {

    static let tvShowArrayMock = [TVShow(id: 1, name: "mike", voteAverage: 8.9, firstAirDate: "2022 12,12", overview: "")]

    lazy var tvShowViewModelArrayMock = TVShowCollectionViewModelTest.tvShowArrayMock.map { TVShowFeedCellViewModel(tvShow: $0)}
    
    static let tvShowArrayMockPage2 = [
        TVShow(id: 3, name: "Uriel", voteAverage: 9.0, firstAirDate: "", overview: "")]

    lazy var tvShowViewModelArrayMockPage2 = TVShowCollectionViewModelTest.tvShowArrayMockPage2.map { TVShowFeedCellViewModel(tvShow: $0)}
    
    func test_inputViewDidLoad_emit_correctOutput_listLoadTvShow() {
        let sut = makeSUT()
        let disposeBag = DisposeBag()
        
        let scheduler = TestScheduler(initialClock: 0)
        
        let inputViewDidLoadEvents: [Recorded<Event<Void>>] = [.next(0, ()), .next(10, ())]
        let viewDidLoad = scheduler.createHotObservable(inputViewDidLoadEvents)
        let didScroll = PublishSubject<TVShowCollectionViewModel.State>()

        let input = TVShowCollectionViewModel.Input(
            viewDidLoad: viewDidLoad.asDriver(onErrorRecover: { _ in return Driver.empty() }),
            didScrollTVShows: didScroll.asDriver(onErrorRecover: { _ in return Driver.empty() }))
        let output = sut.transform(input: input)
        
        let loadTVShowEvents = scheduler.createObserver([TVShowFeedCellViewModel].self)
        output
            .loadTVShows
            .asObservable()
            .bind(to: loadTVShowEvents)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        let outputTVShowEvents: [Recorded<Event<[TVShowFeedCellViewModel]>>] = [ .next(0, tvShowViewModelArrayMock), .next(10, tvShowViewModelArrayMock) ]
        
        XCTAssertEqual(loadTVShowEvents.events, outputTVShowEvents)
    }
    
    func test_inputDidScroll_emit_correctOutput_listLoadTvShow() {
        let sut = makeSUT()
        let disposeBag = DisposeBag()
        
        let scheduler = TestScheduler(initialClock: 0)
        
        let inputViewDidLoadEvents: [Recorded<Event<Void>>] = [.next(0, ()), .next(10, ())]
        let viewDidLoad = scheduler.createHotObservable(inputViewDidLoadEvents)

        let inputDidScrollEvents: [Recorded<Event<TVShowCollectionViewModel.State>>] = [.next(20, .loading), .next(30, .waiting)]
        let didScroll = scheduler.createHotObservable(inputDidScrollEvents)

        let input = TVShowCollectionViewModel.Input(
            viewDidLoad: viewDidLoad.asDriver(onErrorRecover: { _ in return Driver.empty() }),
            didScrollTVShows: didScroll.asDriver(onErrorRecover: { _ in return Driver.empty() }))
        let output = sut.transform(input: input)
        
        
        let loadTVShowEvents = scheduler.createObserver([Int].self)
        output
            .loadTVShows
            .asObservable()
            .map { $0.map { $0.id }}
            .bind(to: loadTVShowEvents)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        let outputTVShowEvents: [Recorded<Event<[Int]>>] = [
            .next(0, tvShowViewModelArrayMock.map { $0.id }),
            .next(10, tvShowViewModelArrayMock.map { $0.id }),
            .next(20, tvShowViewModelArrayMock.map { $0.id } + tvShowViewModelArrayMock.map { $0.id } + tvShowViewModelArrayMockPage2.map { $0.id})
        ]
        
        XCTAssertEqual(loadTVShowEvents.events, outputTVShowEvents)
    }
    
    // MARK: Helper
    
    private func makeSUT() -> TVShowCollectionViewModel {
        let service = TVShowListServiceSpy()
        let sut = TVShowCollectionViewModel(service: service)
        return sut
    }
    
    private final class TVShowListServiceSpy: TVShowListService {
        
        func getItems(page: Int) -> RxSwift.Single<MovieDB.TVShowList> {
            var tvShowList = TVShowList(results: [])
            if page == 2 {
                tvShowList = TVShowList(results: TVShowCollectionViewModelTest.tvShowArrayMockPage2)
            } else {
                tvShowList = TVShowList(results: TVShowCollectionViewModelTest.tvShowArrayMock)
            }
            return .just(tvShowList)
        }

    }

}

