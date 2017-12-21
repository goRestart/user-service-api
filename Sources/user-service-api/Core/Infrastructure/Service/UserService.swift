import CoreService
import Vapor

struct UserService {
  
  private let clientProvider: ClientProvider
  private let userMapper: UserMapper

  init(clientProvider: ClientProvider,
       userMapper: UserMapper)
  {
    self.clientProvider = clientProvider
    self.userMapper = userMapper
  }
  
  func verify(with credentials: UserCredentials) throws -> UserResponse? {
    guard let response = try unwrap(.verify(credentials)) else { return nil }
    
    let userResponseIsIncorrect = response.status != .ok
    guard userResponseIsIncorrect else {
      let user = try userMapper.map(response.json)
      return UserResponse(
        user: user,
        response: response
      )
    }
    return UserResponse(
      user: nil,
      response: response
    )
  }
  
  private func unwrap(_ endpoint: Endpoint) throws -> Response? {
    do {
      return try clientProvider.client().get(endpoint.path)
    } catch {
      return nil
    }
  }
}

