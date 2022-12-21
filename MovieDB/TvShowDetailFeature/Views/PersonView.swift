//
//  PersonView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PersonView: View {
    
    private struct K {
        static var placeholderImage: String = "notFound"
        static var profilePictureSize: CGFloat =  100
        static var profilePictureCornerRadius: CGFloat =  50
    }
    
    @Binding var name: String
    @Binding var profilePicture: String
    
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string: profilePicture))
                .placeholder(UIImage(named:K.placeholderImage))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: K.profilePictureSize, height: K.profilePictureSize)
                .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                .cornerRadius(K.profilePictureCornerRadius)
                .clipped()
            Text(name)
                .font(.subheadline)
                .foregroundColor(ProjectColors.white.color.toSwiftUIColor())
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(name: .constant("Mike"), profilePicture: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
