//
//  TVShowDetailView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct TVShowDetailView: View {
    
    @StateObject var detailsViewModel: TVShowDetailViewModel
    
    private struct K {
        static var paddingTop: CGFloat = 200
        static var cornerRadius: CGFloat = 20
        static var castListPaddingBottom: CGFloat = 10
    }
    
    var arrayPerson: [Person] = [
        Person(name: "mike", profilePath: ""),
        Person(name: "manuel", profilePath: ""),
        Person(name: "stella", profilePath: ""),
        Person(name: "renato", profilePath: ""),
        Person(name: "luiza", profilePath: ""),
        Person(name: "Lourdinha", profilePath: "")
    ]
    
    var body: some View {
        ScrollView {
            ZStack {
                PosterView(image: $detailsViewModel.backDropPath)
                ZStack {
                    VStack {
                        SummaryView(
                            name: $detailsViewModel.tvShowName,
                            overview: $detailsViewModel.overview,
                            creators: $detailsViewModel.creators,
                            season: $detailsViewModel.lastSeason,
                            date: $detailsViewModel.lastSeasonAirDate,
                            posterSeason: $detailsViewModel.poster)
                        CastListView(arrayPerson: arrayPerson)
                            .padding(.bottom, K.castListPaddingBottom)
                    }
                    .frame(maxHeight: .infinity)
                    .background(ProjectColors.darkTwo.color.toSwiftUIColor())
                    .cornerRadius(K.cornerRadius)
                    
                    PopularityView(rating: $detailsViewModel.voteAverage)
                }
                .padding(.top, K.paddingTop)
                .padding(.horizontal, MarginSpaces.horizontalMargin.space)
            }
        }
        .background(ProjectColors.almostBlack.color.toSwiftUIColor())
        .ignoresSafeArea()
    }
    
}

struct TVShowDetailView_Previews: PreviewProvider {
    static let client = URLSessionHTTPClient()
    static let service = TVShowService<TVShowDetails>(client: client)
    static var detailViewModel = TVShowDetailViewModel(service: service, id: 1)
    static var previews: some View {
        TVShowDetailView(detailsViewModel: detailViewModel)
    }
}
