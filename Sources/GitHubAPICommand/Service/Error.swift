//
//  Error.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/5.
//

import Foundation

public enum GitHubEndpointError: Error {
    case invalidGitHubEndpoint(endpoint: EndpointFactory)
    case invalidGitHubEndpointable(endpoint: Endpoint)
}

enum GitHubAPIError: Error {
    case getAccessTokenError
    case getOperationError
    case postOperationError
    case ParameterError
    case ParseError
    case BearerTokenExpiredError
}
