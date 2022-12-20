//
//  SummaryView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct SummaryView: View {
    
    var mockText: String = "Rick is a mentally-unbalanced but scientifically-gifted old man who has recently reconnected with his family. He spends most of his time involving his young grandson Morty in dangerous, outlandish adventures throughout space and alternate universes. Compounded with Morty's already unstable family life, these events cause Morty much distress at home and school."
    
    var arrayPerson: [Person] = [
        Person(name: "mike", profilePath: ""),
        Person(name: "andres", profilePath: ""),
        Person(name: "gustavo", profilePath: ""),
        Person(name: "rodolfo", profilePath: ""),
        Person(name: "manuel", profilePath: ""),
        Person(name: "stella", profilePath: ""),
        Person(name: "renato", profilePath: ""),
        Person(name: "luiza", profilePath: ""),
        Person(name: "Lourdinha", profilePath: "")
    ]
    
    var body: some View {

            VStack(spacing: 20) {
                TitleSection()
                TVShowNameView(tvShowName: "Ricky and Morty")
                DescriptionView(
                    description: mockText,
                    creators: "Dan Harmon, Justin Roiland")
                SeasonView(
                    currentSeason: "Season 4",
                    date: "Nov 10, 2019")
                CastListView(arrayPerson: arrayPerson)
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .background(ProjectColors.darkTwo.color.toSwiftUIColor())
            .cornerRadius(20)
        
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
