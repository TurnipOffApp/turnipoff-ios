//
//  TMDBResponse.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation

struct TMDBResponse<T: Decodable> {

    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [T]

}

extension TMDBResponse: Decodable {

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results = "results"
    }

}
