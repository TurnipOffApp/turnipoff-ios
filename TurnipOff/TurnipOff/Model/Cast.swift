//
//  Cast.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

struct Cast {

    let id: UUID = .init()
    let name: String
    let character: String
    let profilePath: String?

}

// MARK: Codable

extension Cast: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "cast_id"
        case name = "name"
        case profilePath = "profile_path"
        case character = "character"
    }

}

extension Cast: People {

    var role: String { character }

}
