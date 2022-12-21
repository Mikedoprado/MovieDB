//
//  TVShowCastViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//
import Combine

final class TVShowCastViewModel {

    private let service: TVShowService<Cast>
    private let id: Int
    
    @Published var tvShowCast: Cast?
    private var cancellables = Set<AnyCancellable>()
    
    init(service: TVShowService<Cast>, id: Int) {
        self.service = service
        self.id = id
    }
    
    private func getCastTvShow() {
        service
            .getItems(endpoint: InfoById.tvShowCast(id))
            .map { $0 }
            .sink { completion in
                switch completion {
                case .finished:
                    print("get the cast")
                case .failure(_):
                    print(ApiError.responseUnsuccesful)
                }
            } receiveValue: { [weak self] cast in
                self?.tvShowCast = cast
            }.store(in: &cancellables)
    }
    
//    var poster: AnyPublisher<String, Never> {
//        $tvShowCast
//            .compactMap { $0?.cast }
//            .compactMap { ApiPath.baseURLImage.path + ($0.last?.posterPath ?? "notFoundImage") }
//            .eraseToAnyPublisher()
//    }
}
