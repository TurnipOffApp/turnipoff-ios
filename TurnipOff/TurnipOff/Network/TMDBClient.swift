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

    func discover() -> AnyPublisher<TMDBResponse<Movie>, Error> {
        provider.load(.discover)
    }

}
