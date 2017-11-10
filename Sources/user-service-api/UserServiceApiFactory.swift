import Vapor

public struct UserServiceApiFactory {
  
  public static func make() -> UserApi {
    return UserApiClient(
      client: client
    )
  }
  
  private static var client: ClientProtocol {
    return try! EngineClient
      .factory
      .makeClient(
        hostname: "user.restart-api.com",
        port: 80,
        securityLayer: .none,
        proxy: nil
    )
  }
}
