//
//  SeasonView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct SeasonView: View {
    
    var sectionTitle: String = "Last Season"
    var currentSeason: String
    var date: String
    var buttonText: String = "View all Seasons"
    var poster: String = ""
    
    var body: some View {
        VStack{
            HStack {
                Text(sectionTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                Spacer()
            }
            .padding(.leading, MarginSpaces.horizontalMargin.space)
            HStack(spacing: 30) {
                Rectangle()
                    .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                    .frame(height: 220)
                VStack(alignment: .leading, spacing: 10) {
                    Text(currentSeason)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
                    Text(date)
                        .font(.caption)
                        .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                    buttonSeason
                }
            }
            .padding(.horizontal, MarginSpaces.horizontalMargin.space)
        }
    }
    
    private var buttonSeason: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 30)
                .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                Text(buttonText)
                    .font(.caption)
                    .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
            }
        }
    }
}

struct SeasonView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonView(currentSeason: "Season 4", date: "Dec 18, 2022")
            .previewLayout(.sizeThatFits)
    }
}
