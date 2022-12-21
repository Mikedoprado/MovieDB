//
//  TVShowDetailViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//
import Combine
import Foundation

final class TVShowDetailViewModel: ObservableObject {
    
    var service: TVShowDetailService
    var id: Int
    
    @Published var tvShowDetails: TVShowDetails?
    @Published var tvShowName: String = .empty
    @Published var overview: String = .empty
    @Published var creators: String = .empty
    @Published var lastSeason: String = .empty
    @Published var lastSeasonAirDate: String = .empty
    @Published var voteAverage: String = .empty
    @Published var poster: String = .empty
    @Published var backDropPath: String = .empty
    private var cancellables = Set<AnyCancellable>()
    
    init(service: TVShowDetailService, id: Int) {
        self.service = service
        self.id = id
        getDetailsTvShow()
        bindItems()
    }
    
    func bindItems() {
        $tvShowDetails
            .compactMap { $0?.name }
            .receive(on: RunLoop.main)
            .sink { [weak self] name in
                self?.tvShowName = name
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.overview }
            .receive(on: RunLoop.main)
            .sink { [weak self] description in
                self?.overview = description.isEmpty ? "...Opps sorry we don't have description name yet" : description
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.createdBy }
            .map {  $0.map { $0.name }}
            .map { $0.joined(separator: " ") }
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.creators = value.isEmpty ? "" : "Created by \(value)"
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.seasons.last }
            .map { "Season \(String(describing: $0.seasonNumber))" }
            .receive(on: RunLoop.main)
            .sink { [weak self] season in
                self?.lastSeason = season
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.seasons }
            .compactMap { $0.last?.airDate.toDate() }
            .receive(on: RunLoop.main)
            .sink { [weak self] date in
                self?.lastSeasonAirDate = date
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.voteAverage }
            .map { "\(String(describing: $0).prefix(3))" }
            .receive(on: RunLoop.main)
            .sink { [weak self] score in
                self?.voteAverage = score
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.seasons.last }
            .map { $0.posterPath == nil ? "notFoundImage" : ApiPath.baseURLImage.path + ($0.posterPath ?? "") }
            .receive(on: RunLoop.main)
            .sink { [weak self] image in
                self?.poster = image
            }.store(in: &cancellables)
        
        $tvShowDetails
            .map { $0?.backdropPath == nil ? "notFoundImage" : ApiPath.baseURLImage.path + ($0?.backdropPath ?? "") }
            .receive(on: RunLoop.main)
            .sink { [weak self] image in
                self?.backDropPath = image
            }.store(in: &cancellables)
    }
    
    private func getDetailsTvShow() {
        service
            .getItems(endpoint: InfoById.tvShowDetails(id))
            .map { $0 }
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("get the details")
                case .failure(_):
                    print(ApiError.responseUnsuccesful)
                }
            } receiveValue: { [weak self] details in
                self?.tvShowDetails = details
            }.store(in: &cancellables)
    }

}
