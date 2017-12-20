import XCTest
@testable import user_service_api

class user_service_apiTests: XCTestCase {
 
  private let verifyUserCredentials = VerifyUserCredentials()
  
  func test_verify_credentials() throws {
    let credentials = UserCredentials(
      username: "test",
      password: "123456"
    )
    let response = try verifyUserCredentials.execute(with: credentials)
    XCTAssertNotNil(response?.user)
  }
}
