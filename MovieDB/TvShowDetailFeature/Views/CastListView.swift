//
//  CastListView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct CastListView: View {
    
    var titleSection: String = "Cast"
    var arrayPerson: [Person]
    
    var body: some View {
        VStack {
            HStack {
                Text(titleSection)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .center, spacing: 20) {
                    ForEach(arrayPerson, id: \.name) { person in
                        PersonView(name: person.name)
                    }
                }
                .frame(height: 140)
            }
        }
        .padding(.leading, MarginSpaces.horizontalMargin.space)
    }
}

struct CastListView_Previews: PreviewProvider {
    
    static var arrayPerson: [Person] = [
        Person(name: "mike", profilePath: ""),
        Person(name: "andres", profilePath: ""),
        Person(name: "gustavo", profilePath: ""),
        Person(name: "rodolfo", profilePath: ""),
        Person(name: "manuel", profilePath: ""),
        Person(name: "stella", profilePath: ""),
        Person(name: "renato", profilePath: ""),
        Person(name: "luiza", profilePath: ""),
        Person(name: "Lourdinha", profilePath: "")
    ]
    static var previews: some View {
        CastListView(arrayPerson: arrayPerson)
            .previewLayout(.sizeThatFits)
    }
}
