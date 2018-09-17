//
//  Services+Release.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/15.
//

import Foundation
import ObjectMapper

extension Services {
    public func release(request: ReleaseRequest,
                        completionHandler: @escaping CompletionHandler) {
        
        guard let orginization = request.orginization?.value,
            let repository = request.repository?.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }
        
        do {
            let endpoint = try EndpointFactory.Release(host: host(request: request),
                                                       orginization: orginization,
                                                       repository: repository)
            
            guard let name = request.releaseName?.value,
                let body = request.releaseBody?.value,
                let tag = request.releaseTag?.value,
                let commitish = request.releaseCommitish?.value,
                let url = URL(string: endpoint.url) else {
                    completionHandler(nil, nil, GitHubAPIError.ParameterError)
                    return
            }
            
            let requestBody: [AnyHashable:Any] = ["tag_name" : tag,
                                                  "target_commitish" : commitish,
                                                  "name" : name,
                                                  "body" : body]
            post(url: url,
                 request: request,
                 body: requestBody) { (data, response, error) in
                    guard let data = data,
                        let jsonDic = JSONParser(data: data).parsedDictionary else {
                            completionHandler(nil,response, error)
                            return
                    }
                    guard let accessToken = Mapper<GitHubRelease>().map(JSONObject: jsonDic) else {
                        completionHandler(nil,response, error)
                        return
                    }
                    completionHandler(accessToken, response, error)
            }
        } catch {
            print(error)
        }
    }
}
