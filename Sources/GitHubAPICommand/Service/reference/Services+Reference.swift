//
//  Services+Reference.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/25.
//

import Foundation
import ObjectMapper

extension Services {
    public enum Reference: URLSessionDataTaskProtocol {
        fileprivate static var shared: Reference?
        case Create(request: GitHubAPIRequestFactory.CreateReference,
            completionHandler: CompletionHandler)
        
        public func resume() {
            switch self {
            case let .Create(request, completionHandler):
                create(request: request, completionHandler: completionHandler)
            default:
                break
            }
        }
    }
}

extension Services.Reference {
    fileprivate func create(request: GitHubAPIRequestFactory.CreateReference,
                completionHandler: @escaping CompletionHandler) {

        guard let orginization = request.orginization.value,
            let repository = request.repository.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }
        let host = Services.shared.host(request: request)
        let endpoint = EndpointFactory.Reference.create(host: host,
                                                        orginization: orginization,
                                                        repository: repository)
        
        guard let url = URL(string: endpoint.url) else {
            completionHandler(nil, nil, GitHubAPIError.ParameterError)
            return
        }
        
        let referenece = request.referenece.value
        let sha = request.sha.value
        
        let requestBody: [AnyHashable:Any] = ["ref" : referenece,
                                              "sha" : sha]
        Services.shared.post(url: url,
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
    }
}
