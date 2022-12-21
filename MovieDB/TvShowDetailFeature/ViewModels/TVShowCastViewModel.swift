//
//  TVShowCastViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//
import Combine
import SwiftUI

final class PersonViewModel: ObservableObject {
    
    @Published var person: Person
    @Published var name: String = ""
    @Published var profilePicture: String = ""
    private var cancellables = Set<AnyCancellable>()

    init(person: Person) {
        self.person = person
        
        $person
            .map { $0.name }
            .receive(on: RunLoop.main)
            .sink { [weak self] name in
                self?.name = name
            }.store(in: &cancellables)
        
        $person
            .map { $0.profilePath == nil ? "notFoundImage" : ApiPath.baseURLImage.path + ($0.profilePath ?? "") }
            .receive(on: RunLoop.main)
            .sink { [weak self] image in
                self?.profilePicture = image
            }.store(in: &cancellables)
    }
}

final class TVShowCastViewModel: ObservableObject {

    private let service: TVShowService<Cast>
    private let id: Int
    
    @Published var tvShowCast: [PersonViewModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(service: TVShowService<Cast>, id: Int) {
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
                print(cast.cast.map { $0.name })
                self?.tvShowCast = cast.cast.map { PersonViewModel(person: $0) }
            }.store(in: &cancellables)
    }

}
