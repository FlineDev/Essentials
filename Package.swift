// swift-tools-version: 5.8
import PackageDescription

let package = Package(
   name: "Foundation",
   platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
   products: [
      .library(name: "AppFoundation", targets: ["AppFoundation"]),
      .library(name: "FoundationPlus", targets: ["FoundationPlus"]),
      .library(name: "TestFoundation", targets: ["TestFoundation"]),
   ],
   dependencies: [
      // Apple
      .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.4"),

      // FlineDev
      .package(url: "https://github.com/FlineDev/HandySwift.git", branch: "main"),
      .package(url: "https://github.com/FlineDev/HandySwiftUI.git", branch: "main"),

      // 3rd-Party
      .package(url: "https://github.com/pointfreeco/swift-custom-dump.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-identified-collections.git", from: "1.0.0"),
   ],
   targets: [
      .target(
         name: "AppFoundation",  // for Apple Platform applications (like iOS, macOS, or visionOS)
         dependencies: [
            // Package
            "FoundationPlus",
      
            // FlineDev
            .product(name: "HandySwiftUI", package: "HandySwiftUI"),

            // 3rd-Party
            .product(name: "Dependencies", package: "swift-dependencies"),
            .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
         ]
      ),
      .target(
         name: "FoundationPlus",  // for code shared between Apple Platform apps and server-side Vapor apps
         dependencies: [
            // Apple
            .product(name: "OrderedCollections", package: "swift-collections"),

            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),
         ]
      ),
      .target(
         name: "TestFoundation",  // for test targets in Apple Platform projects
         dependencies: [
            // Package
            "FoundationPlus",

            // 3rd-Party
            .product(name: "CustomDump", package: "swift-custom-dump"),
         ]
      ),
   ]
)
