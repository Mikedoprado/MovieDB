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
        Person(name: "mike", posterPath: ""),
        Person(name: "andres", posterPath: ""),
        Person(name: "gustavo", posterPath: ""),
        Person(name: "rodolfo", posterPath: ""),
        Person(name: "manuel", posterPath: ""),
        Person(name: "stella", posterPath: ""),
        Person(name: "renato", posterPath: ""),
        Person(name: "luiza", posterPath: ""),
        Person(name: "Lourdinha", posterPath: "")
    ]
    static var previews: some View {
        CastListView(arrayPerson: arrayPerson)
            .previewLayout(.sizeThatFits)
    }
}
