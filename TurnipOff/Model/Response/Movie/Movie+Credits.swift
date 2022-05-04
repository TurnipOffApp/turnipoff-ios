//
//  Credits.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

extension Movie {

    struct Credits: Identifiable {

        let id: Int
        let casts: [Cast]
        let crews: [Crew]

    }

}

// MARK: Codable

extension Movie.Credits: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case casts = "cast"
        case crews = "crew"
    }

}

extension Movie.Credits: Credits {

    var cast: [Credit] { casts }

    var crew: [Credit] { crews }

}
