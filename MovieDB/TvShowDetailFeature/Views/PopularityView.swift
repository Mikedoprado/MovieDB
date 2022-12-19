//
//  PopularityView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct PopularityView: View {
    var rating: String = "8.6"
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                        .frame(width: 50, height: 50)
                    Text(rating)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
                }
            }
            .padding(.trailing, MarginSpaces.horizontalMargin.space)
            Spacer()
        }.offset(y: -25)
    }
}

struct PopularityView_Previews: PreviewProvider {
    static var previews: some View {
        PopularityView()
            .previewLayout(.sizeThatFits)
    }
}
