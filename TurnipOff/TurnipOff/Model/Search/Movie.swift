//
//  Movie.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 12/04/2022.
//

import Foundation

struct Movie {

    let id: Int
    let title: String

}

// MARK: Codable

extension Movie: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
    }

}
