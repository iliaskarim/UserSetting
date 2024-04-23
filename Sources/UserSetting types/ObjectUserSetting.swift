import Foundation

public struct ObjectUserSetting<T: NSObject & NSSecureCoding>: UserSetting {
  let key: String
  let preset: T

  public var value: T {
    return (UserDefaults.standard.object(forKey: key) as? Data).flatMap {
      try? NSKeyedUnarchiver.unarchivedObject(ofClass: T.self, from: $0)
    } ?? preset
  }

  public func set(_ value: T) {
    (try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: T.self.supportsSecureCoding)).map {
      UserDefaults.standard.setValue($0, forKey: key)
    }
  }

  public init(key: String, preset: T) {
    self.key = key
    self.preset = preset
  }
}
