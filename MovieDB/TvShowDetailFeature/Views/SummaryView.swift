//
//  SummaryView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct SummaryView: View {

    @Binding var name: String
    @Binding var overview: String
    @Binding var creators: String
    @Binding var season: String
    @Binding var date: String
    @Binding var posterSeason: String

    var body: some View {
        
        VStack(spacing: 20) {
            TitleSection()
            TVShowNameView(tvShowName: $name)
            DescriptionView(
                description: $overview,
                creators: $creators)
            SeasonView(
                currentSeason: $season,
                date: $date,
                poster: $posterSeason)
            Spacer()
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
        static var overview: String = "Rick is a mentally-unbalanced but scientifically-gifted old man who has recently static reconnected with his family. He spends most of his time involving his young grandson Morty in static dangerous, outlandish adventures throughout space and alternate universes. Compounded with Morty's static already unstable family life, these events cause Morty much distress at home and school."
        static var name: String = "Ricky and Morty"
        static var creators: String = "Dan Harmon, Justin Roiland"
        static var season: String = "Season 4"
        static var date: String = "Nov 10, 2019"
        static var posterSeason: String = ""
    static var previews: some View {
        SummaryView(name: .constant(name), overview: .constant(overview), creators: .constant(creators), season: .constant(season), date: .constant(date), posterSeason: .constant(posterSeason))
    }
}
