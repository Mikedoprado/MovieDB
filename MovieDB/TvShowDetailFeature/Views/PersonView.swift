//
//  PersonView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct PersonView: View {
    
    var name: String
    var profilePicture: String = ""
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
            Text(name)
                .font(.subheadline)
                .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(name: "Mike")
            .previewLayout(.sizeThatFits)
    }
}
