//
//  SectionViewModel.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation
import Combine

class SectionViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    private var page: Int = 0
    private var pageMax: Int = 1

    @Published private(set) var isLoadingPage = false
    @Published private(set) var movies: [MovieSearch]

    let config: SectionConfig

    init(config: SectionConfig) {
        self.config = config
        self.movies = []
    }

    func getMovies() {
        guard !isLoadingPage && page < pageMax else {
            return
        }

        isLoadingPage = true

        TMDBClient
            .shared
            .discover(
                page: page + 1,
                sort: .ascending,
                genres: config.category.genres,
                period: config.releaseDate
            )
            .receive(on: RunLoop.main)
            .handleEvents(receiveOutput: { moviesResult in
                self.page = moviesResult.page
                self.pageMax = moviesResult.totalPages
                self.isLoadingPage = false
            })
            .map({ moviesResult in
                return self.movies + moviesResult.results
            })
            .catch({ _ in Just(self.movies) })
            .sink { movies in
                self.movies = movies
            }
            .store(in: &subscriptions)
    }

    func loadMoreMoviesIfNeeded(currentMovie movie: MovieSearch) {
        let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
        if movies.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
            getMovies()
        }
      }
}
