//
//  Endpoint.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation

struct Endpoint {

    private static let API_KEY = "7aeaa9d72de6df534afb8b71ac7d82eb"

    let path: String
    let queryParameters: [URLQueryItem]

    init(path: String, queryParameters: [URLQueryItem]) {
        self.path = path
        self.queryParameters = queryParameters
    }

}

extension Endpoint {
    
    func url() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3" + path

        let defaultParams: [URLQueryItem] = [
            .init(name: "api_key", value: Self.API_KEY),
            .init(name: "language", value: Locale.autoupdatingCurrent.languageCode),
            .init(name: "region", value: Locale.autoupdatingCurrent.regionCode),
            .init(name: "adult", value: "false")
        ]

        components.queryItems = defaultParams + queryParameters

        guard let url = components.url else {
            throw NetworkError.invalidRequest
        }

        return url
    }
}
