//
//  TrendingViewModel.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation
import Combine

final class TrendingViewModel: ObservableObject {

    private var subscriptions = Set<AnyCancellable>()
    @Published private(set) var movies: [MovieSearch]

    init() {
        movies = .init()
    }

    func getTrendingList() {
        TMDBClient
            .shared
            .discover(
                page: 1,
                sort: .ascending,
                genres: [],
                period: nil
            )
            .receive(on: RunLoop.main)
            .map { $0.results }
            .catch { _ in Just(self.movies) }
            .sink { movies in
                self.movies = Array(movies.prefix(6))
            }
            .store(in: &subscriptions)
    }
}
