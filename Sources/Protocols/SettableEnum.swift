
public protocol SettableEnum {
  associatedtype RawValue

  var rawValue: RawValue { get }
  init?(rawValue: RawValue)
}
