//
//  Movie.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation

struct Movie: Identifiable {

    let id: Int
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let note: Double
    let genres: [Genre]
    let release: Date
    let runtime: Int
    let overview: String

}

// MARK: Codable

extension Movie: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genres = "genres"
        case note = "vote_average"
        case release = "release_date"
        case runtime = "runtime"
        case overview = "overview"
    }

}

extension Movie {

    struct Genre: Codable {
        let id: Int
        let name: String
    }

}
