//
//  TVShowDetailView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct TVShowDetailView: View {
    
    @StateObject var detailsViewModel: TVShowDetailViewModel
    @StateObject var castViewModel: TVShowCastViewModel
    
    private struct K {
        static var paddingTop: CGFloat = 200
        static var cornerRadius: CGFloat = 20
        static var castListPaddingBottom: CGFloat = 10
    }

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
                        CastListView(arrayPerson: $castViewModel.tvShowCast)
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
    static let detailService = TVShowService<TVShowDetails>(client: client)
    static let castService = TVShowService<Cast>(client: client)
    static let tvShowDetailServiceImpl = TVShowDetailServiceImpl(endpoint: InfoById.tvShowDetails(1), service: detailService)
    static let tvShowCastServiceImpl = TVShowCastServiceImpl(endpoint: InfoById.tvShowCast(1), service: castService)
    static var detailViewModel = TVShowDetailViewModel(service: tvShowDetailServiceImpl, id: 1)
    static var castViewModel = TVShowCastViewModel(service: tvShowCastServiceImpl, id: 1)
    static var previews: some View {
        TVShowDetailView(detailsViewModel: detailViewModel, castViewModel: castViewModel)
    }
}
