//
//  DescriptionView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct DescriptionView: View {
    
    @Binding var description: String
    @Binding var creators: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(description)
                .font(.subheadline)
                .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
            Text(creators)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
        }
        .padding(.horizontal, MarginSpaces.horizontalMargin.space)
    }

}

struct DescriptionView_Previews: PreviewProvider {
    static var description: String = "some description"
    static var creators: String = "Mike"
    static var previews: some View {
        DescriptionView(description: .constant(description), creators: .constant(creators))
            .previewLayout(.sizeThatFits)
    }
}
