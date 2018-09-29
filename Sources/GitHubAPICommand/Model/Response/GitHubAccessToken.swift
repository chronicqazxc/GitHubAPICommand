//
//  GitHubAccessToken.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/6.
//

import Foundation
import ObjectMapper

public struct GitHubAccessToken: GitHubAPIResponse {
    
    public fileprivate(set) var token: String?
    public fileprivate(set) var expiresAt: Date?
    
    public init?(map: Map) {
        // NO-OP
    }
    
    public mutating func mapping(map: Map) {
        token <- map["token"]
        if let expires_at = map["expires_at"].currentValue as? String,
            let date = DateFormatter().gitHubAPIFormatter.date(from: expires_at) {
            let plusEightDate = DateFormatter().gitHubAPIFormatter.string(from: date)
            expiresAt = DateFormatter().gitHubAPIFormatter.date(from: plusEightDate)
        }
    }
}
