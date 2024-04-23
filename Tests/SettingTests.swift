import XCTest
@testable import UserSetting

final class SettingTests: XCTestCase {
#if os(iOS)
  private typealias Color = UIColor
#else
  private typealias Color = NSColor
#endif

  private enum Enum: String, SettableEnum {
    case alpha
    case bravo
  }

  private enum Setting: String, UserSettingKey {
    case colorSetting
    case enumSetting
    case valueSetting
  }

  static private let colorSetting: ObjectUserSetting = Setting.colorSetting.setting(preset: Color.white)
  static private let enumSetting: EnumUserSetting = Setting.enumSetting.setting(preset: Enum.alpha)
  static private let integerSetting: ValueUserSetting = Setting.valueSetting.setting(preset: 1)

  override class func setUp() {
    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
  }

  func testEnumSetting() {
    XCTAssertEqual(Self.enumSetting.value, .alpha)
    Self.enumSetting.set(.bravo)
    XCTAssertEqual(Self.enumSetting.value, .bravo)
  }

  func testObjectSetting() {
    XCTAssertEqual(Self.colorSetting.value, .white)
    Self.colorSetting.set(.yellow)
    XCTAssertEqual(Self.colorSetting.value, .yellow)
  }

  func testValueSetting() {
    XCTAssertEqual(Self.integerSetting.value, 1)
    Self.integerSetting.set(2)
    XCTAssertEqual(Self.integerSetting.value, 2)
  }
}
