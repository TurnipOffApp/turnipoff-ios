//
//  PeopleViewModel.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import Foundation
import Combine

final class PersonViewModel: ObservableObject {

    private var subscriptions = Set<AnyCancellable>()
    private let id: Int
    @Published private(set) var person: Person?
    @Published private(set) var credits: Person.Credits?

    init(id: Int) {
        self.id = id
    }

    func refreshData() {
        refreshPerson()
        refreshCredits()
    }

}

private extension PersonViewModel {

    func refreshPerson() {
        TMDBClient
            .shared
            .people(id: id)
            .receive(on: RunLoop.main)
            .sink { _ in } receiveValue: { person in
                self.person = person
            }
            .store(in: &subscriptions)
    }

    func refreshCredits() {
        TMDBClient
            .shared
            .credits(forPeople: id)
            .receive(on: RunLoop.main)
            .sink { _ in } receiveValue: { credits in
                self.credits = credits
            }
            .store(in: &subscriptions)
    }

}
