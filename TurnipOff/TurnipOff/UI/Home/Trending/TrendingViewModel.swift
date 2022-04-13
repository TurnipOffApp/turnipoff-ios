//
//  TrendingViewModel.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation
import Combine

final class TrendingViewModel: ObservableObject {

    var cancellables = Set<AnyCancellable>()
    @Published var movies: [Movie]

    init() {
        movies = .init()
    }

    func getTrendingList() {
        let cancellable = TMDBClient
            .shared
            .trending(type: .movie, time: .week)
            .receive(on: RunLoop.main)
            .sink { _ in } receiveValue: { value in
                self.movies = value.results
            }
        cancellables.insert(cancellable)
    }
}
