import XCTest
import ObjectMapper
@testable import GitHubAPICommand

final class GitHubTagObjectTest: XCTestCase {
    func testGitHubTagObjectResponse() {
        let bundle = Bundle(for: JSONParserTest.self)
        guard let url = bundle.url(forResource: "MockTagObject", withExtension: ".json"),
            let data = try? Data.init(contentsOf: url) else {
                let dic = [
                    "tag" : "v0.0.1",
                    "sha" : "940bd336248efae0f9ee5bc7b2d5c985887b16ac",
                    "url" : "https://api.github.com/repos/octocat/Hello-World/git/tags/940bd336248efae0f9ee5bc7b2d5c985887b16ac",
                    "message" : "initial version",
                    "tagger" : [
                        "name" : "Scott Chacon",
                        "email" : "schacon@gmail.com",
                        "date" : "2014-11-07T22:01:45Z"
                    ],
                    "object" : [
                        "type" : "commit",
                        "sha" : "c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c",
                        "url" : "https://api.github.com/repos/octocat/Hello-World/git/commits/c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c"
                    ],
                    "verification" : [
                        "verified" : false,
                        "reason" : "unsigned",
                        "signature" : nil,
                        "payload" : nil
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
        
        guard let tagObject = Mapper<GitHubTagObject>().map(JSONObject: parser.parsedDictionary) else {
            XCTFail("testJSONParserParsedDictioinary Failed")
            return
        }
        
        XCTAssertEqual(tagObject.tag, "v0.0.1")
        XCTAssertEqual(tagObject.sha, "940bd336248efae0f9ee5bc7b2d5c985887b16ac")
        XCTAssertEqual(tagObject.url, "https://api.github.com/repos/octocat/Hello-World/git/tags/940bd336248efae0f9ee5bc7b2d5c985887b16ac")
        XCTAssertEqual(tagObject.message, "initial version")
        XCTAssertEqual(tagObject.tagger?.name, "Scott Chacon")
        XCTAssertEqual(tagObject.tagger?.email, "schacon@gmail.com")
        XCTAssertEqual(tagObject.object?.type, "commit")
        XCTAssertEqual(tagObject.object?.sha, "c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c")
        XCTAssertEqual(tagObject.object?.url, "https://api.github.com/repos/octocat/Hello-World/git/commits/c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c")
        XCTAssertEqual(tagObject.verification?.verified, false)
        XCTAssertEqual(tagObject.verification?.reason, "unsigned")
        XCTAssertNil(tagObject.verification?.signature)
        XCTAssertNil(tagObject.verification?.payload)
    }
}
