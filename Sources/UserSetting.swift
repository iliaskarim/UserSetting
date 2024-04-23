
public protocol UserSetting {
  var rawValue: String { get }
}

public extension UserSetting {
  func setting<T>(preset: T) -> Setting<T> {
    .init(key: rawValue, preset: preset)
  }
}
