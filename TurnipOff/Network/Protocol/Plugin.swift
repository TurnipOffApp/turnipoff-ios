//
//  Plugin.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation

protocol Plugin {
    func prepare(_ request: URLRequest, service: Service) -> URLRequest
}

extension Plugin {
    func prepare(_ request: URLRequest, service: Service) -> URLRequest { request }
}
