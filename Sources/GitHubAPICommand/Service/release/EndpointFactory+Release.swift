//
//  EndpointFactory+Release.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/15.
//

import Foundation

extension EndpointFactory {
    public struct Release: Endpoint {
        
        public var host: Host
        
        public var orginization: String
        
        public var repository: String
        
        public var url: String {
            
            switch host {
                case .github:
                    return "\(host.value)/repos/\(orginization)/\(repository)/releases"
                case .enterprise:
                    return "\(host.value)/api/v3/repos/\(orginization)/\(repository)/releases"
            }
        }
        
        public var httpMethod: String {
            get {
                return "POST"
            }
        }
        
        public init(host: Host,
                    orginization: String,
                    repository: String) throws {
            guard host.value != "",
                orginization != "",
                repository != "" else {
                    throw GitHubAPIError.ParameterError
            }
            self.host = host
            self.orginization = orginization
            self.repository = repository
        }
    }
}
