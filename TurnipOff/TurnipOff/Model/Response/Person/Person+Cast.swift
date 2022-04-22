//
//  Cast.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import Foundation

extension Person.Credits {

    struct Cast {

        let id: Int
        let internalID = UUID()
        let title: String
        let character: String
        let imagePath: String?
        let average: Float

    }

}

// MARK: Codable

extension Person.Credits.Cast: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case imagePath = "poster_path"
        case character = "character"
        case average = "vote_average"
    }

}

extension Person.Credits.Cast: Credit {

    var role: String { character }

    var type: CreditType { .movie }

}
