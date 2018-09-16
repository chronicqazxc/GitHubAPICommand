import XCTest
@testable import GitHubAPICommand

struct MockEndpoint: Endpoint {
    var host: GitHubAPICommand.Host
    
    var orginization: String
    
    var repository: String
    
    var url: String {
        return ""
    }
    
    var httpMethod: String {
        return "GET"
    }
    
    init(host: GitHubAPICommand.Host, orginization: String, repository: String) {
        self.host = host
        self.orginization = orginization
        self.repository = repository
    }
}

final class EndpointTest: XCTestCase {
    func testGETEndpoint() {
        let endpoint = MockEndpoint(host: .github, orginization: "", repository: "")
//        let url = endpoint.url(endpoint: EndpointFactory())
        let httpMethod = endpoint.httpMethod
//        print(url)
        print(httpMethod)
    }
    
    func testEndpointFactoryGetAccessTokenHttpMethod() {

        do {
            let factory = try EndpointFactory.GetAccessToken(host: .github,
                                                             installationId: "7")
            XCTAssertEqual(factory.httpMethod, "POST")
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func testEndpointFactoryGetAccessTokenUrl() {
        
        do {
            let factory = try EndpointFactory.GetAccessToken(host: .github,
                                                             installationId: "7")
            XCTAssertEqual(factory.url, "https://api.github.com/app/installations/7/access_tokens")
        } catch {
            XCTFail("\(error)")
        }
    }
}
