//
//  Credits.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import Foundation

extension Person {

    struct Credits: Identifiable {

        let id: Int
        let casts: [Cast]
        let crews: [Crew]

    }

}

// MARK: Codable

extension Person.Credits: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case casts = "cast"
        case crews = "crew"
    }

}

extension Person.Credits: Credits {

    var cast: [Credit] { casts }

    var crew: [Credit] { crews }

}
