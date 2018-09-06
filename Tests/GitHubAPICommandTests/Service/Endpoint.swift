import XCTest
@testable import GitHubAPICommand

enum MockEndpoint: Endpoint {
    case `init`
    func url(endpoint: EndpointFactory) throws -> String {
        return ""
    }
    var httpMethod: String {
        return "GET"
    }
}

final class EndpointTest: XCTestCase {
    func testGETEndpoint() {
        let endpoint = MockEndpoint.init
//        let url = endpoint.url(endpoint: EndpointFactory())
        let httpMethod = endpoint.httpMethod
//        print(url)
        print(httpMethod)
    }
    
    func testEndpointFactoryGetAccessTokenHttpMethod() {
        let factory = EndpointFactory.getAccessTokenUrl(host: .github,
                                                        getAccessToken: .parameter(installationId: "7"))
        XCTAssertEqual(factory.httpMethod, "POST")
    }
    
    func testEndpointFactoryGetAccessTokenUrl() {
        
        let factory = EndpointFactory.getAccessTokenUrl(host: .github,
                                                        getAccessToken: .parameter(installationId: "7"))
        XCTAssertEqual(factory.url, "https://api.github.com/app/installations/7/access_tokens")
    }
}
