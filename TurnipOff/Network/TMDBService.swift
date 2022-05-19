//
//  TMDBService.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation
import Combine

enum TMDBService {

    case discover(page: Int, sort: Sort = .ascending, genres: [MovieGenre], period: ClosedRange<Date>?)
    case movie(id: Int)
    case movieCredits(id: Int)
    case people(id: Int)
    case peopleCredits(id: Int)
}

extension TMDBService: Service {

    var baseURL: String { "https://api.themoviedb.org/3" }

    var path: String {
        switch self {
        case .discover:
            return "/discover/movie"
        case let .movie(id):
            return "/movie/\(id)"
        case let .movieCredits(id):
            return "/movie/\(id)/credits"
        case let .people(id):
            return "/person/\(id)"
        case let .peopleCredits(id):
            return "/person/\(id)/movie_credits"
        }
    }

    var parameters: [URLQueryItem] {
        let parameters: [URLQueryItem]
        switch self {
        case let .discover(page, sort, genres, period):
            parameters = [
                .init(name: "page", value: String(page)),
                .init(name: "vote_count.gte", value: "25"),
                .init(name: "sort_by", value: ["vote_average", sort.rawValue].joined(separator: ".")),
                .init(name: "with_genres", value: genres.map(\.rawValue).joined(separator: ",")),
                .init(name: "release_date.gte", value: period.map { Self.dateFormatter.string(from: $0.lowerBound) }),
                .init(name: "release_date.lte", value: period.map { Self.dateFormatter.string(from: $0.upperBound) })
            ]
        case .movie, .movieCredits, .people, .peopleCredits:
            parameters = []
        }
        return Self.defaultParams + parameters.filter { $0.value != nil }
    }

    var method: ServiceMethod {
        switch self {
        case .discover, .movie, .movieCredits, .people, .peopleCredits:
            return .get
        }
    }

    var contentType: ContentType {
        switch self {
        case .discover, .movie, .movieCredits, .people, .peopleCredits:
            return .json
        }
    }

    var decoder: JSONDecoder { Self.decoder }

}

fileprivate extension TMDBService {

    static let API_KEY = "7aeaa9d72de6df534afb8b71ac7d82eb"

    static var dateFormatter: DateFormatter = {
        let aoDateFormatter = DateFormatter()
        aoDateFormatter.dateFormat = "yyyy-MM-dd"
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
        .init(name: "region", value: "US"),
        .init(name: "adult", value: "false")
    ]

}
