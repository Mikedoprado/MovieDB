//
//  PosterView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PosterView: View {
    
    private struct K {
        static var placeholderImage: String = "notFoundImage"
    }
    
    @Binding var image: String
    
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string: image))
                .placeholder(UIImage(named:K.placeholderImage))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(ProjectColors.coral.color.toSwiftUIColor())
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .clipShape(Rectangle())
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(image: .constant(""))
    }
}
