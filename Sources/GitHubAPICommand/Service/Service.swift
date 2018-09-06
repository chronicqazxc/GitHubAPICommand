//
//  Service.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/6.
//

import Foundation
import ObjectMapper

typealias CompletionHandler = (GitHubAPIResponse?, URLResponse?, Error?)->Void
typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?)->Void
typealias GetAccessTokenCompletionHandler = (Data?, URLResponse?, Error?)->Void

class Service {
    static let shared = Service()
    
    fileprivate var accessToken: GitHubAccessToken?
    
    fileprivate init() {
        
    }
    
    func post(url: URL,
              request: GitHubAPIRequest,
              body: [AnyHashable:Any]? = nil,
              overrideHeader: [String:String]? = nil,
              completionHandler: @escaping NetworkCompletionHandler) {
        getAccessToken(request: request) { (data, response, error) in
            
            guard let accessToken = self.accessToken?.token,
                let body = body else {
                    completionHandler(nil, response, GitHubAPIError.BearerTokenExpiredError)
                    return
            }
            
            do {
                var request = URLRequest(url: url)
                
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                request.httpBody = jsonData
                request.httpMethod = "POST"
                overrideHeader?.enumerated().forEach({ (arg) in
                    request.addValue(arg.element.value, forHTTPHeaderField: arg.element.key)
                })
                request.addValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
                request.addValue("application/vnd.github.machine-man-preview+json", forHTTPHeaderField: "Accept")
                
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    completionHandler(data, response, error)
                }
                
                task.resume()
            } catch {
                print(error.localizedDescription)
                completionHandler(nil, nil, error)
            }
        }
    }
    
    func get(request: GitHubAPIRequest,
             url: URL,
             overrideHeader: [String:String]? = nil,
             completionHandler: @escaping NetworkCompletionHandler) {
        getAccessToken(request: request) { (data, response, error) in
            
            guard let accessToken = self.accessToken?.token else {
                completionHandler(nil, response, GitHubAPIError.BearerTokenExpiredError)
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            overrideHeader?.enumerated().forEach({ (arg) in
                request.addValue(arg.element.value, forHTTPHeaderField: arg.element.key)
            })
            request.addValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
            request.addValue("application/vnd.github.machine-man-preview+json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                completionHandler(data, response, error)
            }
            task.resume()
        }
    }
    
    fileprivate func getAccessToken(request: GitHubAPIRequest,
                                    completionHandler: @escaping GetAccessTokenCompletionHandler) {
        /*
         curl -i -X POST \
         -H "Authorization: Bearer YOUR_JWT" \
         -H "Accept: application/vnd.github.machine-man-preview+json" \
         https://api.github.com/app/installations/:installation_id/access_tokens
         */
        guard let bearerToken = request.token?.value,
            let _ = request.orginization?.value,
            let _ = request.repository?.value,
            let installationId = request.installationID?.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }
        
        var endpoint: EndpointFactory!
        let getAccessToken = EndpointFactory.GetAccessToken.parameter(installationId: installationId)
        if let host = request.host?.value {
            endpoint = EndpointFactory.getAccessTokenUrl(host: .enterprise(host: host),
                                                         getAccessToken: getAccessToken)
        } else {
            endpoint = EndpointFactory.getAccessTokenUrl(host: .github,
                                                         getAccessToken: getAccessToken)
        }
        
        let overrideHeader = [
            "Authorization" : "Bearer \(bearerToken)",
            "Accept" : "application/vnd.github.machine-man-preview+json"
        ]
        
        var request = URLRequest(url: URL(string: endpoint.url)!)
        request.httpMethod = endpoint.httpMethod
        overrideHeader.enumerated().forEach({ (arg) in
            request.addValue(arg.element.value, forHTTPHeaderField: arg.element.key)
        })
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                let jsonDic = JSONParser(data: data).parsedDictionary else {
                    completionHandler(nil, response, error)
                    return
            }
            guard let accessToken = Mapper<GitHubAccessToken>().map(JSONObject: jsonDic) else {
                completionHandler(data, response, error)
                return
            }
            
            self.accessToken = accessToken
            
            completionHandler(data, response, error)
        }
        
        task.resume()
    }
}

extension Service {
    
}
