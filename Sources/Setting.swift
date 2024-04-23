import Foundation

public struct Setting<T> {
  let key: String
  let preset: T

  public var value: T {
    UserDefaults.standard.value(forKey: key) as? T ?? preset
  }

  public func set(_ value: T) {
    UserDefaults.standard.set(value, forKey: key)
  }
}
