//
//  Endpoint+GetLatestRelease.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/9.
//

import Foundation

extension EndpointFactory {
    public struct GetLatestRelease: Endpoint {
        public var host: Host
        
        public var orginization: String
        
        public var repository: String
        
        public var url: String {
            switch host {
            case .github:
                return "\(host.value)/repos/\(orginization)/\(repository)/releases/latest"
            case .enterprise:
                return "\(host.value)/api/v3/repos/\(orginization)/\(repository)/releases/latest"
            }
        }
        
        public var httpMethod: String {
            get {
                return "GET"
            }
        }
        
        public init(host: Host, orginization: String, repository: String) {
            self.host = host
            self.orginization = orginization
            self.repository = repository
        }
    }
}
