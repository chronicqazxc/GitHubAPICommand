//
//  Services.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/6.
//

import Foundation
import ObjectMapper

public typealias CompletionHandler = (GitHubAPIResponse?, URLResponse?, Error?)->Void
public typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Swift.Void
public typealias GetAccessTokenCompletionHandler = (Data?, URLResponse?, Error?)->Void

public protocol URLRequestProtocol {
    var url: URL? { get set }
}

public protocol URLSessionProtocol {
    func dataTask(with request: URLRequestProtocol,
                  completionHandler: @escaping NetworkCompletionHandler) -> URLSessionDataTaskProtocol
}

public protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSession: URLSessionProtocol {
    public func dataTask(with request: URLRequestProtocol, completionHandler: @escaping NetworkCompletionHandler) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler)
    }
    
}
extension URLSessionDataTask: URLSessionDataTaskProtocol {
}

extension URLRequest: URLRequestProtocol {
    
}

public class Services {
    
    fileprivate var accessToken: GitHubAccessToken?
    let session: URLSessionProtocol
    
    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func post(url: URL,
              request: Request,
              body: [AnyHashable:Any]? = nil,
              overrideHeader: [String:String]? = nil,
              completionHandler: @escaping NetworkCompletionHandler) {
        guard let getAccessTokenRequest = request as? GitHubAPIRequestFactory.GetAccessToken else {
            completionHandler(nil, nil, GitHubAPIError.ParameterError)
            return
        }
        getAccessToken(request: getAccessTokenRequest) { [weak self] (data, response, error) in
            
            guard let strongSelf = self,
                let accessToken = strongSelf.accessToken?.token,
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
                
                if let session = strongSelf.session as? URLSession {
                    let task = session.dataTask(with: request) { (data, response, error) in
                        completionHandler(data, response, error)
                    }
                    
                    task.resume()
                } else {
                    let task = strongSelf.session.dataTask(with: request) { (data, response, error) in
                        completionHandler(data, response, error)
                    }
                    task.resume()
                }
            } catch {
                print(error.localizedDescription)
                completionHandler(nil, nil, error)
            }
        }
    }
    
    func get(request: Request,
             url: URL,
             overrideHeader: [String:String]? = nil,
             completionHandler: @escaping NetworkCompletionHandler) {
        guard let getAccessTokenRequest = request as? GitHubAPIRequestFactory.GetAccessToken else {
            completionHandler(nil, nil, GitHubAPIError.ParameterError)
            return
        }
        getAccessToken(request: getAccessTokenRequest) { [weak self] (data, response, error) in
            
            guard let strongSelf = self,
                let accessToken = strongSelf.accessToken?.token else {
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
            
            if let session = strongSelf.session as? URLSession {
                let task = session.dataTask(with: request) { (data, response, error) in
                    completionHandler(data, response, error)
                }
                task.resume()
            } else {
                let task = strongSelf.session.dataTask(with: request) { (data, response, error) in
                    completionHandler(data, response, error)
                }
                task.resume()
            }
        }
    }
    
    func host(request: Request) -> Host {
        var host: Host!
        if let hostValue = request.host?.value {
            host = .enterprise(host: hostValue)
        } else {
            host = .github
        }
        return host
    }
    
    fileprivate func getAccessToken(request: GitHubAPIRequestFactory.GetAccessToken,
                                    completionHandler: @escaping GetAccessTokenCompletionHandler) {
        /*
         curl -i -X POST \
         -H "Authorization: Bearer YOUR_JWT" \
         -H "Accept: application/vnd.github.machine-man-preview+json" \
         https://api.github.com/app/installations/:installation_id/access_tokens
         */
        guard let bearerToken = request.token.value,
            let installationId = request.installationID.value else {
                completionHandler(nil, nil, GitHubAPIError.ParameterError)
                return
        }

        let getAccessToken = EndpointFactory.GetAccessToken(host: host(request: request),
                                                                  installationId: installationId)

        let overrideHeader = [
            "Authorization" : "Bearer \(bearerToken)",
            "Accept" : "application/vnd.github.machine-man-preview+json"
        ]
        
        var request = URLRequest(url: URL(string: getAccessToken.url)!)
        request.httpMethod = getAccessToken.httpMethod
        overrideHeader.enumerated().forEach({ (arg) in
            request.addValue(arg.element.value, forHTTPHeaderField: arg.element.key)
        })
        
        if let session = session as? URLSession {
            let task = session.dataTask(with: request) { [weak self] (data, response, error) in
                guard let strongSelft = self,
                    let data = data,
                    let jsonDic = JSONParser(data: data).parsedDictionary else {
                        completionHandler(nil, response, error)
                        return
                }
                guard let accessToken = Mapper<GitHubAccessToken>().map(JSONObject: jsonDic) else {
                    completionHandler(data, response, error)
                    return
                }
                
                strongSelft.accessToken = accessToken
                
                completionHandler(data, response, error)
            }
            task.resume()
        } else {
            let task = session.dataTask(with: request) { (data, response, error) in
                completionHandler(data, response, error)
            }
            task.resume()
        }
    }
}
