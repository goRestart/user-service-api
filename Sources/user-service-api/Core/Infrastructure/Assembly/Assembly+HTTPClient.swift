import CoreService
import Vapor

extension Assembly {
  var httpClient: ClientProtocol {
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
