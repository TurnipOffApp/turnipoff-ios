//
//  Crew.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

extension Movie.Credits {

    struct Crew {

        let id: Int
        let internalID = UUID()
        let title: String
        let job: String
        let imagePath: String?

    }

}

// MARK: Codable

extension Movie.Credits.Crew: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "name"
        case imagePath = "profile_path"
        case job = "job"
    }

}

extension Movie.Credits.Crew: Credit {

    var role: String { job }

    var type: CreditType { .person }
}
