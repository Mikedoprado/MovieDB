//
//  PersonViewModel.swift
//  MovieDB
//
//  Created by Michael Conchado on 21/12/22.
//

import Combine
import SwiftUI

final class PersonViewModel: ObservableObject {
    
    @Published var person: Person
    @Published var name: String = ""
    @Published var profilePicture: String = ""
    private var cancellables = Set<AnyCancellable>()

    init(person: Person) {
        self.person = person
        
        $person
            .map { $0.name }
            .receive(on: RunLoop.main)
            .sink { [weak self] name in
                self?.name = name
            }.store(in: &cancellables)
        
        $person
            .map { $0.profilePath == nil ? "notFound" : ApiPath.baseURLImage.path + ($0.profilePath ?? "") }
            .receive(on: RunLoop.main)
            .sink { [weak self] image in
                self?.profilePicture = image
            }.store(in: &cancellables)
    }
}
