import CoreService

extension Assembly {
  var userService: UserService {
    return UserService(
      clientProvider: self,
      userMapper: userMapper
    )
  }
}
