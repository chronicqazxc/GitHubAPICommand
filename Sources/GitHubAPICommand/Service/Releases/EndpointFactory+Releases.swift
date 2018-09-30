//
//  EndpointFactory+Release.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/15.
//

import Foundation

extension EndpointFactory {
    public enum Releases: Endpoint {
        case getLatest(host: Host, orginization: String, repository: String)
        case create(host: Host, orginization: String, repository: String)
        
        var parameters: (host: Host, orginization: String, repository: String) {
            get {
                switch self {
                case let .getLatest(host, orginization, repository):
                    return (host, orginization, repository)
                case let .create(host, orginization, repository):
                    return (host, orginization, repository)
                }
            }
        }
        
        public var host: Host {
            return parameters.host
        }
        
        public var orginization: String {
            return parameters.orginization
        }
        
        public var repository: String {
            return parameters.repository
        }
        
        public var url: String {
            // POST /repos/:owner/:repo/git/refs
            switch self {
            case .create:
                switch host {
                case .github:
                    return "\(host.value)/repos/\(orginization)/\(repository)/releases"
                case .enterprise:
                    return "\(host.value)/api/v3/repos/\(orginization)/\(repository)/releases"
                }
            case .getLatest:
                switch host {
                case .github:
                    return "\(host.value)/repos/\(orginization)/\(repository)/releases/latest"
                case .enterprise:
                    return "\(host.value)/api/v3/repos/\(orginization)/\(repository)/releases/latest"
                }
            }
        }
        
        public var httpMethod: String {
            switch self {
            case .getLatest:
                return "GET"
            case .create:
                return "POST"
            }
        }
    }
}
