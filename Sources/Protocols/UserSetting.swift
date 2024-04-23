
public protocol UserSetting {
  associatedtype Value

  var value: Value { get }
  func set(_ value: Value)
  init(key: String, preset: Value)
}
