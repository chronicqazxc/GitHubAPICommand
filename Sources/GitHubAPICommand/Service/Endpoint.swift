//
//  Endpoint.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/5.
//

import Foundation

public protocol Endpoint {
    func url(endpoint: EndpointFactory) throws -> String
    var httpMethod: String { get }
}

public enum EndpointFactory {
    // https://developer.github.com/v3/apps/available-endpoints/
    // https://developer.github.com/enterprise/2.13/v3/apps/available-endpoints/
    case getAccessTokenUrl(host: Host, getAccessToken: GetAccessToken)
    case url(host: Host,
        orginization: String,
        repository: String,
        endpoint: Endpoint)
    
    public var httpMethod: String {
        switch self {
        case let .url(_, _, _, endpointable):
            return endpointable.httpMethod
        case let .getAccessTokenUrl(_, getAccessToken):
            return getAccessToken.httpMethod
        }
    }
    
    public var url: String {
        get {
            switch self {
            case let .url(_, _, _, endpointable):
                return (try? endpointable.url(endpoint: self)) ?? ""
            case let .getAccessTokenUrl(_, getAccessToken):
                return (try? getAccessToken.url(endpoint: self)) ?? ""
            }
        }
    }
    
    public enum GetAccessToken: Endpoint {
        case parameter(installationId: String)
        
        public func url(endpoint: EndpointFactory) throws -> String {
            switch self {
            case let .parameter(installationId):
                switch endpoint {
                case .url:
                    throw GitHubEndpointError.invalidGitHubEndpoint(endpoint: endpoint)
                case let .getAccessTokenUrl(host, _):
                    switch host {
                    case .github:
                        return "\(host.value)/app/installations/\(installationId)/access_tokens"
                    case .enterprise:
                        return "\(host.value)/api/v3/installations/\(installationId)/access_tokens"
                    }
                }
            }
        }
        
        public var httpMethod: String {
            get {
                return "POST"
            }
        }
    }
}
