// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "UserSetting",
  products: [
    .library(
      name: "Setting",
      targets: ["UserSetting"]),
  ],
  targets: [
    .target(
      name: "UserSetting"),
  ]
)
