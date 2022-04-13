//
//  CachePolicyService.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation

protocol CachePolicyService {
    var cachePolicy: URLRequest.CachePolicy? { get }
}
