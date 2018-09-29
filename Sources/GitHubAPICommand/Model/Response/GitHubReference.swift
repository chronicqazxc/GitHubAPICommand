//
//  GitHubReference.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/23.
//

import Foundation
import ObjectMapper

public struct GitHubReference: GitHubAPIResponse {
    public fileprivate(set) var ref: String?
    public fileprivate(set) var nodeId: String?
    public fileprivate(set) var url: String?
    public fileprivate(set) var object: GitHubReference.Object?
    
    public struct Object: GitHubAPIResponse {
        public fileprivate(set) var type: String?
        public fileprivate(set) var sha: String?
        public fileprivate(set) var url: String?
        
        public init?(map: Map) {
            // NO-OP
        }
        public mutating func mapping(map: Map) {
            type <- map["type"]
            sha <- map["sha"]
            url <- map["url"]
        }
    }
    
    public init?(map: Map) {
        // NO-OP
    }
    
    public mutating func mapping(map: Map) {
        ref <- map["ref"]
        nodeId <- map["node_id"]
        url <- map["url"]
        object <- map["object"]
    }
}
