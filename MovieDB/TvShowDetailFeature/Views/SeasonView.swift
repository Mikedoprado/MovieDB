//
//  SeasonView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SeasonView: View {
    
    private struct K {
        static var sectionTitle: String = "Last Season"
        static var buttonText: String = "View all Seasons"
        static var placeholderImage: String = "notFoundImage"
        static var imageHeight: CGFloat = 230
        static var imageWidthDivider: CGFloat = 2.8
        static var spacingImageButton: CGFloat = 30
        static var spacingDateButton: CGFloat = 10
        static var buttonRoundCorners: CGFloat = 5
        static var buttonHeight: CGFloat = 30
    }
    
    @Binding var currentSeason: String
    @Binding var date: String
    @Binding var poster: String
    
    var body: some View {
        VStack{
            HStack {
                Text(K.sectionTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                Spacer()
            }
            .padding(.leading, MarginSpaces.horizontalMargin.space)
            HStack(spacing: K.spacingImageButton) {
                    AnimatedImage(url: URL(string: poster))
                        .placeholder(UIImage(named:K.placeholderImage))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                        .frame(maxWidth: MarginSpaces.sizeWidthScreen.space / K.imageWidthDivider)
                        .frame(height: K.imageHeight)
                        .clipped()
                
                VStack(alignment: .leading, spacing: K.spacingDateButton) {
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
                RoundedRectangle(cornerRadius: K.buttonRoundCorners)
                    .frame(height: K.buttonHeight)
                .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                Text(K.buttonText)
                    .font(.caption)
                    .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
            }
        }
    }
}

struct SeasonView_Previews: PreviewProvider {
    static var sectionTitle: String = "Last Season"
    static var currentSeason: String = ""
    static var date: String = ""
    static var buttonText: String = "View all Seasons"
    static var poster: String = ""
    static var previews: some View {
        SeasonView(currentSeason: .constant(currentSeason), date: .constant(date), poster: .constant(poster))
            .previewLayout(.sizeThatFits)
    }
}
