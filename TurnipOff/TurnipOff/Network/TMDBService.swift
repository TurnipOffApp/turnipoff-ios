//
//  TMDBService.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation
import Combine

final class TMDBService {

    static func discover() -> AnyPublisher<TMDBResponse<Movie>, Error> {
        let endpoint = Endpoint(path: "/discover/movie", queryParameters: [])
        let request = Request(
            endpoint: endpoint,
            method: .get,
            contentType: .json
        )
        return NetworkClient.shared.performRequest(request)
    }


}
