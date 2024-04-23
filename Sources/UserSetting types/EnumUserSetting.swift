import Foundation

public struct EnumUserSetting<T: SettableEnum>: UserSetting {
  let key: String
  let preset: T

  public var value: T {
    (UserDefaults.standard.value(forKey: key) as? T.RawValue).flatMap(T.init(rawValue:)) ?? preset
  }

  public func set(_ value: T) {
    UserDefaults.standard.setValue(value.rawValue, forKey: key)
  }

  public init(key: String, preset: T) {
    self.key = key
    self.preset = preset
  }
}
