import Foundation

public struct ValueUserSetting<T>: UserSetting {
  let key: String
  let preset: T

  public var value: T {
    UserDefaults.standard.value(forKey: key) as? T ?? preset
  }

  public func set(_ value: T) {
    UserDefaults.standard.set(value, forKey: key)
  }

  public init(key: String, preset: T) {
    self.key = key
    self.preset = preset
  }
}
