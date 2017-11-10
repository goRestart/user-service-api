import Vapor

public protocol UserApi {
  func register(_ credentials: BasicCredentials) -> Response
  func verify(_ credentials: UserCredentials) -> Response
}
