//
//  TVShowCastViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//
import Combine
import SwiftUI

final class TVShowCastViewModel: ObservableObject {

    private let service: TVShowCastService
    private let id: Int
    
    @Published var tvShowCast: [PersonViewModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(service: TVShowCastService, id: Int) {
        self.service = service
        self.id = id
        getCastTvShow()
    }
    
    private func getCastTvShow() {
        service
            .getItems(endpoint: InfoById.tvShowCast(id))
            .map { $0 }
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("get the cast")
                case .failure(_):
                    print(ApiError.responseUnsuccesful)
                }
            } receiveValue: { [weak self] cast in
                self?.tvShowCast = cast.cast.map { PersonViewModel(person: $0) }
            }.store(in: &cancellables)
    }

}
