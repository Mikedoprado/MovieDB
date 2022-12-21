//
//  TVShowsCollectionViewControllerTest.swift
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

final class TVShowsCollectionViewControllerTest: XCTestCase {

    func test() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.collectionView?.numberOfItems(inSection: 0), 1)
    }
    
    // MARK: Helper
    
    private func makeSUT() -> TVShowsCollectionViewController {
        let service = TVShowListServiceSpy()
        let viewModel = TVShowCollectionViewModel(service: service)
        let sut = TVShowsCollectionViewController(viewModel: viewModel)
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
