//
//  CastListView.swift
//  MovieDB
//
//  Created by Michael Conchado on 18/12/22.
//

import SwiftUI

struct CastListView: View {
    
    private struct K {
        static var sectionName: String = "Cast"
    }
    
    @Binding var arrayPerson: [PersonViewModel]
    
    var body: some View {
        VStack {
            HStack {
                Text(arrayPerson.isEmpty ? "" : K.sectionName)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(ProjectColors.algaeGreen.color.toSwiftUIColor())
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .center, spacing: 20) {
                    ForEach($arrayPerson, id: \.id) { person in
                        PersonView(name: person.name, profilePicture: person.profilePicture)
                    }
                }
                .frame(height: arrayPerson.isEmpty ? 0 : 140)
            }
        }
        .padding(.leading, MarginSpaces.horizontalMargin.space)
    }
}

struct CastListView_Previews: PreviewProvider {
    
    static var arrayPerson: [Person] = [
        Person(id: 1, name: "mike", profilePath: ""),
        Person(id: 2, name: "andres", profilePath: ""),
        Person(id: 3,name: "gustavo", profilePath: ""),
        Person(id: 4,name: "rodolfo", profilePath: ""),
        Person(id: 5,name: "manuel", profilePath: ""),
        Person(id: 6,name: "stella", profilePath: ""),
        Person(id: 7,name: "renato", profilePath: ""),
        Person(id: 8,name: "luiza", profilePath: ""),
        Person(id: 9,name: "Lourdinha", profilePath: "")
    ]
    static var arrayPersonViewModel = arrayPerson.map { PersonViewModel(person: $0) }
    static var previews: some View {
        CastListView(arrayPerson: .constant(arrayPersonViewModel))
            .previewLayout(.sizeThatFits)
    }
}
