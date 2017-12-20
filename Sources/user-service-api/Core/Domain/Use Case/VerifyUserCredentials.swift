import CoreService

public struct VerifyUserCredentials {
  
  private let userService: UserService
  
  init(userService: UserService) {
    self.userService = userService
  }
  
  public func execute(with credentials: UserCredentials) throws -> UserResponse? {
    return try userService.verify(with: credentials)
  }
}

// MARK: - Public initializer {

extension VerifyUserCredentials {
  public init() {
    self.init(userService: resolver.userService)
  }
}
