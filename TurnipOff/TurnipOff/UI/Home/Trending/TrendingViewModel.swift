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
            .discover()
            .receive(on: RunLoop.main)
            .sink { completion in
                dump(completion)
            } receiveValue: { value in
                self.movies = value.results
                dump(value)
            }
        cancellables.insert(cancellable)
    }
}
