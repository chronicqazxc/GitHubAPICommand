//
//  EndpointFactory+Reference.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/25.
//

import Foundation

extension EndpointFactory {
    public enum Reference: Endpoint {
        case get(host: Host, orginization: String, repository: String)
        case getAll(host: Host, orginization: String, repository: String)
        case create(host: Host, orginization: String, repository: String)
        case update(host: Host, orginization: String, repository: String)
        case delete(host: Host, orginization: String, repository: String)
        
        var parameters: (host: Host, orginization: String, repository: String) {
            get {
                switch self {
                case let .get(host, orginization, repository):
                    return (host, orginization, repository)
                case let .getAll(host, orginization, repository):
                    return (host, orginization, repository)
                case let .create(host, orginization, repository):
                    return (host, orginization, repository)
                case let .update(host, orginization, repository):
                    return (host, orginization, repository)
                case let .delete(host, orginization, repository):
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
            case .get:
                return ""
            case .getAll:
                return ""
            case .create:
                switch host {
                case .github:
                    return "\(host.value)/repos/\(orginization)/\(repository)/git/refs"
                case .enterprise:
                    return "\(host.value)/api/v3/repos/\(orginization)/\(repository)/git/refs"
                }
            case .update:
                return ""
            case .delete:
                return ""
            }
        }

        public var httpMethod: String {
            switch self {
            case .get:
                return ""
            case .getAll:
                return ""
            case .create:
                return "POST"
            case .update:
                return ""
            case .delete:
                return ""
            }
        }
    }
}
