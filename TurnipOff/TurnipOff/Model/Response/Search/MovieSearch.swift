//
//  MovieSearch.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation

struct MovieSearch: Identifiable {

    let id: Int
    let posterPath: String?

}

// MARK: Codable

extension MovieSearch: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
    }

}
