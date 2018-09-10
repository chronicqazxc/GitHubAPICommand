import XCTest
@testable import GitHubAPICommand

class MockURLSession: URLSessionProtocol {
    
    private (set) var lastURL: URL?
    var nextDataTask = MockURLSessionDataTask()
    
    func dataTask(with request: URLRequestProtocol,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTaskProtocol {
        request.url
//        lastURL = request.url
//        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        return nextDataTask
    }
}
