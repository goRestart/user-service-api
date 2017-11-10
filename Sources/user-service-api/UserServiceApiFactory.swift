import Vapor

public struct UserServiceApiFactory {
  
  public static func make() -> UserApi {
    return UserApiClient(
      client: client
    )
  }
  
  private static var client: ClientProtocol {
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
