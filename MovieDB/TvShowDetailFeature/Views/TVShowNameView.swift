//
//  TVShowNameView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct TVShowNameView: View {
    
    @Binding var tvShowName: String
    
    var body: some View {
        HStack (alignment: .center){
            Text(tvShowName)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
            Spacer()
            Image(systemName: Icons.heart.systemIcon)
                .resizable()
                .frame(width: 25, height: 22)
                .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                .padding(.trailing, 5)
        }
        .padding(.horizontal, MarginSpaces.horizontalMargin.space)
    }
}

struct TVShowNameView_Previews: PreviewProvider {
    static var tvShowName: String = "Rick and Morty"
    static var previews: some View {
        TVShowNameView(tvShowName: .constant(tvShowName))
            .previewLayout(.sizeThatFits)
    }
}
