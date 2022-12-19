//
//  PosterView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct PosterView: View {
    
    var image: String = ""
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(ProjectColors.coral.color.toSwiftUIColor())
                .frame(maxWidth: .infinity)
                .frame(height: 250)
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView()
    }
}
