//
//  Credit.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

enum CreditType {
    case movie
    case person
}

protocol Credit: Codable {

    var id: Int { get }
    var internalID: UUID { get }
    var title: String { get }
    var role: String { get }
    var imagePath: String? { get }

    var type: CreditType { get }

}

protocol Credits: Codable {

    var id: Int { get }
    var cast: [Credit] { get }
    var crew: [Credit] { get }

}
