import Vapor
import HTTP

private struct Endpoint {
  static let register = "/"
  static let verify = "/verify"
}

private struct Parameter {
  static let username = "username"
  static let password = "password"
  static let email = "email"
}

public struct UserAPI {

  public func register(_ credentials: BasicCredentials) -> Response {
    let query = [
      Parameter.username: credentials.username,
      Parameter.password: credentials.password,
      Parameter.email: credentials.email
    ]
    return try! client.post(Endpoint.register, query: query)
  }
  
  public func verify(_ credentials: UserCredentials) -> Response {
    let query = [
      Parameter.username: credentials.username,
      Parameter.password: credentials.password
    ]
    return try! client.post(Endpoint.verify, query: query)
  }
}

extension UserAPI {
  private var client: ClientProtocol {
    return try! Config()
      .resolveClient()
      .makeClient(
        hostname: "user.restart-api.com",
        port: 80,
        securityLayer: .none,
        proxy: nil
    )
  }
}
