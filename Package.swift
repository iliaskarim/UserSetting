// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "UserSetting",
  products: [
    .library(name: "UserSetting", targets: ["UserSetting"]),
  ],
  targets: [
    .target(name: "UserSetting"),
    .testTarget(name: "UserSettingTests", dependencies: ["UserSetting"]),
  ]
)
