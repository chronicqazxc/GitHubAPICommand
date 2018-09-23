import XCTest
import ObjectMapper
@testable import GitHubAPICommand

final class GitHubReferenceTest: XCTestCase {
    func testGitHubReferenceResponse() {
        let bundle = Bundle(for: JSONParserTest.self)
        guard let url = bundle.url(forResource: "MockReference", withExtension: ".json"),
            let data = try? Data.init(contentsOf: url) else {
                let dic = [
                    "ref" : "refs/heads/featureA",
                    "node_id" : "MDM6UmVmcmVmcy9oZWFkcy9mZWF0dXJlQQ==",
                    "url" : "https://api.github.com/repos/octocat/Hello-World/git/refs/heads/featureA",
                    "object" : [
                        "type" : "commit",
                        "sha" : "aa218f56b14c9653891f9e74264a383fa43fefbd",
                        "url" : "https://api.github.com/repos/octocat/Hello-World/git/commits/aa218f56b14c9653891f9e74264a383fa43fefbd"
                    ]
                    ] as [String : Any]
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                    let parser = JSONParser(data: jsonData)
                    XCTAssertNotNil(parser.parsedDictionary)
                } catch {
                    XCTFail("testJSONParserParsedDictioinary Failed")
                }
                return
        }
        let parser = JSONParser(data: data)
        XCTAssertNotNil(parser.parsedDictionary)
        
        guard let reference = Mapper<GitHubReference>().map(JSONObject: parser.parsedDictionary) else {
            XCTFail("testJSONParserParsedDictioinary Failed")
            return
        }
        
        XCTAssertEqual(reference.ref, "refs/heads/featureA")
        XCTAssertEqual(reference.nodeId, "MDM6UmVmcmVmcy9oZWFkcy9mZWF0dXJlQQ==")
        XCTAssertEqual(reference.url, "https://api.github.com/repos/octocat/Hello-World/git/refs/heads/featureA")
        XCTAssertEqual(reference.object?.type, "commit")
        XCTAssertEqual(reference.object?.sha, "aa218f56b14c9653891f9e74264a383fa43fefbd")
        XCTAssertEqual(reference.object?.url, "https://api.github.com/repos/octocat/Hello-World/git/commits/aa218f56b14c9653891f9e74264a383fa43fefbd")
        
    }
}
