//
//  Cast.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

extension Movie.Credits {

    struct Cast {

        let id: Int
        let internalID = UUID()
        let title: String
        let character: String?
        let imagePath: String?

    }

}

// MARK: Codable

extension Movie.Credits.Cast: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "name"
        case imagePath = "profile_path"
        case character = "character"
    }

}

extension Movie.Credits.Cast: Credit {

    var role: String? { character }

    var type: CreditType { .person }

}
