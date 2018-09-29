//
//  Services+Reference.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/25.
//

import Foundation
import ObjectMapper

extension Services {
    public func createReference(request: GitHubAPIRequestFactory.CreateReference,
                                completionHandler: @escaping CompletionHandler) {
        
        guard let orginization = request.orginization.value,
            let repository = request.repository.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }

        do {
            let endpoint = try EndpointFactory.Release(host: host(request: request),
                                                       orginization: orginization,
                                                       repository: repository)

            guard let url = URL(string: endpoint.url) else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
            }
            
            /*
             {
             "ref": "refs/heads/featureA",
             "sha": "aa218f56b14c9653891f9e74264a383fa43fefbd"
             }
             */
            

            let referenece = request.referenece.value
            let sha = request.sha.value

            let requestBody: [AnyHashable:Any] = ["ref" : referenece,
                                                  "sha" : sha]
            post(url: url,
                 request: request,
                 body: requestBody) { (data, response, error) in
                    guard let data = data,
                        let jsonDic = JSONParser(data: data).parsedDictionary else {
                            completionHandler(nil,response, error)
                            return
                    }
                    guard let accessToken = Mapper<GitHubReference>().map(JSONObject: jsonDic) else {
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
