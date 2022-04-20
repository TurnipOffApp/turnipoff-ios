//
//  Crew.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

struct Crew {

    let id: UUID = .init()
    let name: String
    let job: String
    let profilePath: String?

}

// MARK: Codable

extension Crew: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case profilePath = "profile_path"
        case job = "job"
    }

}

extension Crew: People {

    var role: String { job }

}
