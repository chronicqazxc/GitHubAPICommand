//
//  GitHubAPIRequest+Reference.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/23.
//

import Foundation

public protocol CreateRefereneceRequest: BasicRequest {
    var referenece: GitHubAPIArgument.Reference { get }
    var sha: GitHubAPIArgument.Reference { get }
}

extension GitHubAPIRequestFactory {
    
    struct CreateReference: CreateRefereneceRequest {
        
        public private(set) var orginization: GitHubAPIArgument
        
        public private(set) var repository: GitHubAPIArgument
        
        public private(set) var action: GitHubAPIArgument
        
        public private(set) var token: GitHubAPIArgument
        
        public private(set) var host: GitHubAPIArgument?
        
        public private(set) var referenece: GitHubAPIArgument.Reference
        
        public private(set) var sha: GitHubAPIArgument.Reference
    }
}


