
public protocol UserSettingKey {
  var rawValue: String { get }
}

public extension UserSettingKey {
  func setting<T: UserSetting>(preset: T.Value) -> T {
    .init(key: rawValue, preset: preset)
  }
}
