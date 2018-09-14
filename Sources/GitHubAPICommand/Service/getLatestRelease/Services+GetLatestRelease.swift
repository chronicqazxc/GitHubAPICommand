//
//  Service+GetLatestRelease.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/9.
//

import Foundation
import ObjectMapper

extension Services {
    func getLatestRelease(request: GitHubAPIRequest,
                          completionHandler: @escaping CompletionHandler) {
        
        guard let orginization = request.orginization?.value,
            let repository = request.repository?.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }

        let endpoint = EndpointFactory.GetLatestRelease(host: host(request: request),
                                                        orginization: orginization,
                                                        repository: repository)
        guard let url = URL(string: endpoint.url) else {
            completionHandler(nil, nil, GitHubAPIError.ParameterError)
            return
        }
        
        get(request: request, url: url) { (data, response, error) in
            guard let data = data,
                let jsonDic = JSONParser(data: data).parsedDictionary else {
                    completionHandler(nil, response, error)
                    return
            }
            guard let accessToken = Mapper<GitHubRelease>().map(JSONObject: jsonDic) else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(accessToken, response, error)
        }
    }
}
