//
//  DescriptionView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct DescriptionView: View {
    
    var description: String
    var creators: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(description)
                .font(.subheadline)
                .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
            Text(setCreator(creator:creators))
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
        }
        .padding(.horizontal, MarginSpaces.horizontalMargin.space)
    }
    
    private func setCreator(creator: String) -> String {
        return "Created by \(creators)"
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(description: "some description", creators: "Mike")
            .previewLayout(.sizeThatFits)
    }
}
