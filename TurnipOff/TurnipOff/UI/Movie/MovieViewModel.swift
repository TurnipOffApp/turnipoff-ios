//
//  MovieViewModel.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation
import Combine

final class MovieViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    private let id: Int
    @Published private(set) var movie: Movie?
    @Published private(set) var credits: Credits?

    init(id: Int) {
        self.id = id
    }

    func refreshData() {
        refreshMovie()
        refreshCredits()
    }

}

private extension MovieViewModel {

    func refreshMovie() {
        let cancellable = TMDBClient
            .shared
            .movie(id: id)
            .receive(on: RunLoop.main)
            .sink { completion in
                dump(completion)
            } receiveValue: { value in
                self.movie = value
            }
        cancellables.insert(cancellable)
    }

    func refreshCredits() {
        let cancellable = TMDBClient
            .shared
            .credits(forMovie: id)
            .receive(on: RunLoop.main)
            .sink { completion in
                dump(completion)
            } receiveValue: { value in
                self.credits = value
            }
        cancellables.insert(cancellable)
    }
}
