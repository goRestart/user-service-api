import CoreService

enum Endpoint {
  case verify(UserCredentials)
  
  var path: String {
    switch self {
    case .verify(let credentials):
      return "/verify?username=\(credentials.username)&password=\(credentials.password)"
    }
  }
}
