//
//  Endpoint+GetLatestRelease.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/9.
//

import Foundation

extension EndpointFactory {
    public enum GetLatestRelease: Endpoint {
        case `init`
        
        public func url(endpoint: EndpointFactory) throws -> String {
            switch endpoint {
            case let .url(host, orginization, repository, _):
                switch host {
                case .github:
                    return "\(host.value)/repos/\(orginization)/\(repository)/releases/latest"
                case .enterprise:
                    return "\(host.value)/api/v3/repos/\(orginization)/\(repository)/releases/latest"
                }
            case .getAccessTokenUrl:
                throw GitHubEndpointError.invalidGitHubEndpoint(endpoint: endpoint)
            }
        }
        
        public var httpMethod: String {
            get {
                return "GET"
            }
        }
    }
}
