import XCTest
@testable import user_service_api

class user_service_apiTests: XCTestCase {
  
  let userApi = UserAPI()
  
  func test_register_user_with_basic_credentials() {
    let credentials = BasicCredentials(
      username: "test",
      password: "1234567",
      email: "test@test.com"
    )
    let response = userApi.register(credentials)
    XCTAssertNotNil(response)
  }
  
  func test_verify_credentials() {
    let credentials = UserCredentials(
      username: "test",
      password: "1234561"
    )
    let response = userApi.verify(credentials)
    XCTAssertNotNil(response)
  }
}
