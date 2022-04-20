//
//  TMDBClient.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation
import Combine

final class TMDBClient {

    typealias Error = NetworkError

    static let shared = TMDBClient()

    private let provider: ServiceProvider<TMDBService>

    private init() {
        provider = .init(plugins: [CachePolicyPlugin()])
    }

}

extension TMDBClient {

    func movie(
        id: Int
    ) -> AnyPublisher<Movie, Error> {
        provider.load(.movie(id: id))
    }

    func credits(
        forMovie id: Int
    ) -> AnyPublisher<Credits, Error> {
        provider.load(.movieCredits(id: id))
    }

    func discover(
        page: Int,
        sort: Sort = .ascending,
        genres: [MovieGenre] = [],
        period: ClosedRange<Date>? = nil
    ) -> AnyPublisher<TMDBResponse<MovieSearch>, Error> {
        provider.load(.discover(page: page, sort: sort, genres: genres, period: period))
    }

}
