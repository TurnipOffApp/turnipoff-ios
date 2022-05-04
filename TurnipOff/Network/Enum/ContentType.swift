//
//  ContentType.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation

enum ContentType {
    case json

    var value: String {
        switch self {
        case .json: return "application/json"
        }
    }
}
