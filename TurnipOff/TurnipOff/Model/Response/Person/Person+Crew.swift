//
//  Crew.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 22/04/2022.
//

import Foundation

extension Person.Credits {

    struct Crew {

        let id: Int
        let internalID = UUID()
        let title: String
        let job: String
        let imagePath: String?
        let average: Float

    }

}

// MARK: Codable

extension Person.Credits.Crew: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case imagePath = "poster_path"
        case job = "job"
        case average = "vote_average"

    }

}

extension Person.Credits.Crew: Credit {

    var role: String { job }

    var type: CreditType { .movie }

}
