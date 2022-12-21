//
//  TVShowDetailViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//
import Combine

final class TVShowDetailViewModel: ObservableObject {
    
    var service: TVShowService<TVShowDetails>
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
    
    init(service: TVShowService<TVShowDetails>, id: Int) {
        self.service = service
        self.id = id
        getDetailsTvShow()
        bindItems()
    }
    
    func bindItems() {
        $tvShowDetails
            .compactMap { $0?.name }
            .sink { [weak self] name in
                self?.tvShowName = name
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.overview }
            .sink { [weak self] description in
                self?.overview = description.isEmpty ? "" : description
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.createdBy }
            .map {  $0.map { $0.name }}
            .map { $0.joined(separator: " ") }
            .sink { [weak self] value in
                self?.creators = value.isEmpty ? "" : "Created by \(value)"
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.seasons.last }
            .map { "Season \(String(describing: $0.seasonNumber))" }
            .sink { [weak self] season in
                self?.lastSeason = season
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.seasons }
            .compactMap { $0.last?.airDate.toDate() }
            .sink { [weak self] date in
                self?.lastSeasonAirDate = date
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.voteAverage }
            .map { "\(String(describing: $0).prefix(3))" }
            .sink { [weak self] score in
                self?.voteAverage = score
            }.store(in: &cancellables)
        
        $tvShowDetails
            .compactMap { $0?.seasons }
            .compactMap { ApiPath.baseURLImage.path + ($0.last?.posterPath ?? "notFoundImage") }
            .sink { [weak self] image in
                self?.poster = image
            }.store(in: &cancellables)
        
        $tvShowDetails
            .map { ApiPath.baseURLImage.path + ($0?.backdropPath ?? "notFoundImage") }
            .sink { [weak self] image in
                self?.backDropPath = image
            }.store(in: &cancellables)
    }
    
    private func getDetailsTvShow() {
        service
            .getItems(endpoint: InfoById.tvShowDetails(id))
            .map { $0 }
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
