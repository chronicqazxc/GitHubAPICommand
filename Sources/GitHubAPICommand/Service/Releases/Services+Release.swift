//
//  Services+Release.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/15.
//

import Foundation
import ObjectMapper

extension Services {
    public enum Release: URLSessionDataTaskProtocol {
        case create(request: GitHubAPIRequestFactory.Release,
            completionHandler: CompletionHandler)
        case getLatest(request: GitHubAPIRequestFactory.GetLatestRelease,
            completionHandler: CompletionHandler)
        
        public func resume() {
            switch self {
            case let .create(request, completionHandler):
                release(request: request, completionHandler: completionHandler)
            case let .getLatest(request, completionHandler):
                getLatestRelease(request: request, completionHandler: completionHandler)
            }
        }
    }
}

extension Services.Release {
    fileprivate func getLatestRelease(request: GitHubAPIRequestFactory.GetLatestRelease,
                                      completionHandler: @escaping CompletionHandler) {
        
        guard let orginization = request.orginization.value,
            let repository = request.repository.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }
        
        let host = Services.shared.host(request: request)
        let endpoint = EndpointFactory.Releases.getLatest(host: host,
                                                          orginization: orginization,
                                                          repository: repository)
        guard let url = URL(string: endpoint.url) else {
            completionHandler(nil, nil, GitHubAPIError.ParameterError)
            return
        }
        
        Services.shared.get(request: request, url: url) { (data, response, error) in
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
    
    fileprivate func release(request: GitHubAPIRequestFactory.Release,
                             completionHandler: @escaping CompletionHandler) {
        
        guard let orginization = request.orginization.value,
            let repository = request.repository.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }
        
        let host = Services.shared.host(request: request)
        let endpoint = EndpointFactory.Releases.create(host: host,
                                                       orginization: orginization,
                                                       repository: repository)
        
        guard let url = URL(string: endpoint.url) else {
            completionHandler(nil, nil, GitHubAPIError.ParameterError)
            return
        }
        
        let name = request.releaseName.value
        let body = request.releaseBody.value
        let tag = request.releaseTag.value
        let commitish = request.releaseCommitish.value
        
        let requestBody: [AnyHashable:Any] = ["tag_name" : tag,
                                              "target_commitish" : commitish,
                                              "name" : name,
                                              "body" : body]
        Services.shared.post(url: url,
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
    }
}
