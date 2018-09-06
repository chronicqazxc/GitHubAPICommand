//
//  JSONParser.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/6.
//

import Foundation

enum ParseType: String {
    case JSON
}

protocol Parser {
    init(data: Data)
    var parsedData: Any? { get }
}

struct ParseData {
    let parseType: ParseType
    let key: String
    let data: Data
}

class JSONParser: Parser {
    
    fileprivate(set) var parsedData: Any?
    
    var parsedDictionary: NSDictionary? {
        get {
            return parsedData as? NSDictionary
        }
    }
    
    public required init(data: Data) {
        parsedData = try? JSONSerialization.jsonObject(with: data, options: [])
    }
}
