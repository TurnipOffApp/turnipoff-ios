//
//  CachePolicyPlugin.swift
//  TurnipOff
//
//  Created by Gaël Foppolo on 13/04/2022.
//

import Foundation

final class CachePolicyPlugin: Plugin {

    func prepare(_ request: URLRequest, service: Service) -> URLRequest {
        guard let policyGettable = service as? CachePolicyService,
                let policy = policyGettable.cachePolicy else {
            return request
        }

        var mutableRequest = request
        mutableRequest.cachePolicy = policy
        return mutableRequest
    }

}
