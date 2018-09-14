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
    var orginization: String { get }
    var repository: String { get }
    var url: String { get }
    init(host: Host,
         orginization: String,
         repository: String)
}

public enum EndpointFactory {
    // https://developer.github.com/v3/apps/available-endpoints/
    // https://developer.github.com/enterprise/2.13/v3/apps/available-endpoints/
    case endpoint(Endpoint)
    
    var endpoint: Endpoint {
        get {
            switch self {
            case let .endpoint(endpoint):
                return endpoint
            }
        }
    }
    
    public var httpMethod: String {
        return endpoint.httpMethod
    }
    
    public var url: String {
        return endpoint.url
    }
}

extension EndpointFactory {
    struct GetAccessToken: Endpoint {
        public var host: Host
        
        public var orginization: String
        
        public var repository: String
        
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
        
        public init(host: Host,
                    installationId: String) {
            self.host = host
            self.orginization = ""
            self.repository = ""
            self.installationId = installationId
        }
        
        public init(host: Host,
                    orginization: String,
                    repository: String) {
            self.host = host
            self.orginization = orginization
            self.repository = repository
            self.installationId = ""
        }
    }
}
