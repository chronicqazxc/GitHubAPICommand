//
//  Endpoint.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/5.
//

import Foundation

public protocol Endpoint {
    var httpMethod: String { get }
    var host: Host { get }
    var url: String { get }
}

public protocol GitHubEndpoint: Endpoint {
    init(host: Host,
         orginization: String,
         repository: String) throws
}

public protocol GitHubGetAccessTokenEndpoint: Endpoint {
    var installationId: String { get }
    init(host: Host,
         installationId: String) throws
}

public enum EndpointFactory {
    // https://developer.github.com/v3/apps/available-endpoints/
    // https://developer.github.com/enterprise/2.13/v3/apps/available-endpoints/
}

extension EndpointFactory {
    struct GetAccessToken: GitHubGetAccessTokenEndpoint {
        public var host: Host
        
        public var installationId: String
        
        public var url: String {
            switch host {
            case .github:
                return "\(host.value)/app/installations/\(installationId)/access_tokens"
            case .enterprise:
                return "\(host.value)/api/v3/installations/\(installationId)/access_tokens"
            }
        }
        
        public var httpMethod: String {
            get {
                return "POST"
            }
        }
    }
}
