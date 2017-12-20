import Foundation

public struct BasicCredentials: Credentials {
 
  public let username: String
  public let password: String
  public let email: String
  
  public init(username: String,
              password: String,
              email: String)
  {
    self.username = username
    self.password = password
    self.email = email
  }
}
