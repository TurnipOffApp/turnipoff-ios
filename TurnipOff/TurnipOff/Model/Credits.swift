//
//  Credits.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

struct Credits: Identifiable {

    let id: Int
    let cast: [Cast]
    let creww: [Crew]

}

// MARK: Codable

extension Credits: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cast = "cast"
        case creww = "crew"
    }

}
