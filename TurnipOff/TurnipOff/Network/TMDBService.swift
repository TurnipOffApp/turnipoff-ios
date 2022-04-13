//
//  TMDBService.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation
import Combine

enum TMDBService {

    case discover
    case trending(media: MediaType, time: TimeWindow)
}

extension TMDBService: Service {

    var baseURL: String { "https://api.themoviedb.org/3" }

    var path: String {
        switch self {
        case .discover:
            return "/discover/movie"
        case let .trending(media, time):
            return "/trending/\(media)/\(time)"
        }
    }

    var parameters: [URLQueryItem] {
        let parameters: [URLQueryItem]
        switch self {
        case .discover:
            #warning("update")
            parameters = []
        case .trending:
            parameters = []
        }
        return Self.defaultParams + parameters
    }

    var method: ServiceMethod {
        switch self {
        case .discover, .trending:
            return .get
        }
    }

    var contentType: ContentType {
        switch self {
        case .discover, .trending:
            return .json
        }
    }

    var decoder: JSONDecoder { Self.decoder }

}

extension TMDBService: CachePolicyService {

    var cachePolicy: URLRequest.CachePolicy? {
        .reloadIgnoringLocalCacheData
    }

}

fileprivate extension TMDBService {

    static let API_KEY = "7aeaa9d72de6df534afb8b71ac7d82eb"

    static var dateFormatter: DateFormatter = {
        let aoDateFormatter = DateFormatter()
        aoDateFormatter.dateFormat = "yyyy-dd-MM"
        return aoDateFormatter
    }()

    static var decoder: JSONDecoder {
        let aoJSONDecoder = JSONDecoder()
        aoJSONDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return aoJSONDecoder
    }

    static let defaultParams: [URLQueryItem] = [
        .init(name: "api_key", value: Self.API_KEY),
        .init(name: "language", value: Locale.autoupdatingCurrent.languageCode),
        .init(name: "region", value: Locale.autoupdatingCurrent.regionCode),
        .init(name: "adult", value: "false")
    ]

}
