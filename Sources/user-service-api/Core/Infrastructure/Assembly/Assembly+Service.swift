import CoreService

extension Assembly {
  var userService: UserService {
    return UserService(
      client: httpClient,
      userMapper: userMapper
    )
  }
}
