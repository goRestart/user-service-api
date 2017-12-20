import CoreService
import Vapor

private struct JSONKey {
  static let root = "user"
  static let identifier = "id"
  static let username = "username"
}

struct UserMapper: Mappable {
  func map(_ from: JSON) throws -> User {
    guard let json = from[JSONKey.root] else {
      throw UserError.invalidResponse
    }
    guard let identifier = json[JSONKey.identifier]?.string else {
      throw UserError.invalidResponse
    }
    guard let username = json[JSONKey.username]?.string else {
      throw UserError.invalidResponse
    }
    return User(
      id: Identifier(identifier),
      username: username
    )
  }
}
