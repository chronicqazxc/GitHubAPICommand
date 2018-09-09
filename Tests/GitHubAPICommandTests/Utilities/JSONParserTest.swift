import XCTest
@testable import GitHubAPICommand

final class JSONParserTest: XCTestCase {
    func testJSONParserParsedDictioinary() {
        let bundle = Bundle(for: JSONParserTest.self)
        guard let url = bundle.url(forResource: "MockData", withExtension: ".json"),
            let data = try? Data.init(contentsOf: url) else {
            XCTFail("testJSONParserParsedDictioinary Failed")
            return
        }
        let parser = JSONParser(data: data)
        XCTAssertNotNil(parser.parsedDictionary)
    }
}
