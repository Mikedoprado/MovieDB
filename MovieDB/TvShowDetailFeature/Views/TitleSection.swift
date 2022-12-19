//
//  TitleSection.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct TitleSection: View {
    
    var title: String = "Summary"
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, MarginSpaces.horizontalMargin.space)
    }
}

struct TitleSection_Previews: PreviewProvider {
    static var previews: some View {
        TitleSection()
    }
}
