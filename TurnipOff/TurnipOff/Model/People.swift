//
//  People.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 20/04/2022.
//

import Foundation

protocol People: Codable {

    var id: UUID { get }
    var name: String { get }
    var role: String { get }
    var profilePath: String? { get }

}
