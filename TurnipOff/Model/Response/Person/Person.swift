//
//  Person.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import Foundation

struct Person: Identifiable {

    let id: Int
    let name: String
    let profilePath: String?
    let birthday: Date?
    let bornLocation: String?
    let biography: String

}

// MARK: Codable

extension Person: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case profilePath = "profile_path"
        case birthday = "birthday"
        case bornLocation = "place_of_birth"
        case biography = "biography"
    }

}
