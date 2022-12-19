//
//  TVShowDetailView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct TVShowDetailView: View {
    
    var body: some View {
        ScrollView {
            ZStack {
                PosterView()
                ZStack {
                    SummaryView()
                    PopularityView()
                }
                .padding(.top, 200)
                .padding(.horizontal, MarginSpaces.horizontalMargin.space)
            }
        }
        .background(ProjectColors.almostBlack.color.toSwiftUIColor())
        .ignoresSafeArea()
    }
    
}

struct TVShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailView()
    }
}
