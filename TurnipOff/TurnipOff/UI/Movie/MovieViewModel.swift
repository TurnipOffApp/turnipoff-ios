//
//  MovieViewModel.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation
import Combine

final class MovieViewModel: ObservableObject {

    private var subscriptions = Set<AnyCancellable>()
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
        TMDBClient
            .shared
            .movie(id: id)
            .receive(on: RunLoop.main)
            .sink { _ in } receiveValue: { movie in
                self.movie = movie
            }
            .store(in: &subscriptions)
    }

    func refreshCredits() {
        TMDBClient
            .shared
            .credits(forMovie: id)
            .receive(on: RunLoop.main)
            .sink { _ in } receiveValue: { credits in
                self.credits = credits
            }
            .store(in: &subscriptions)
    }
}
