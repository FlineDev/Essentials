// swift-tools-version: 5.8
import PackageDescription

let package = Package(
   name: "Foundation",
   platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
   products: [
      .library(name: "AppFoundation", targets: ["AppFoundation"]),
      .library(name: "SharedFoundation", targets: ["SharedFoundation"]),
      .library(name: "VaporAppFoundation", targets: ["VaporAppFoundation"]),
      .library(name: "TestFoundation", targets: ["TestFoundation"]),
      .library(name: "VaporTestFoundation", targets: ["VaporTestFoundation"]),
   ],
   dependencies: [
      // Apple
      .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.4"),

      // Vapor
      .package(url: "https://github.com/vapor/vapor.git", from: "4.76.0"),
      .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),

      // FlineDev
      .package(url: "https://github.com/FlineDev/HandySwift.git", branch: "main"),
      .package(url: "https://github.com/FlineDev/HandySwiftUI.git", branch: "main"),

      // 3rd-Party
      .package(url: "https://github.com/pointfreeco/swift-custom-dump.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-identified-collections.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-tagged.git", from: "0.10.0"),
   ],
   targets: [
      .target(
         name: "AppFoundation",  // for Apple Platform applications (like iOS, macOS, or visionOS)
         dependencies: [
            // Apple
            .product(name: "OrderedCollections", package: "swift-collections"),
      
            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),
            .product(name: "HandySwiftUI", package: "HandySwiftUI"),

            // 3rd-Party
            .product(name: "Dependencies", package: "swift-dependencies"),
            .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
            .product(name: "Tagged", package: "swift-tagged"),
         ]
      ),
      .target(
         name: "SharedFoundation",  // for code shared between Apple Platform apps and server-side Vapor apps
         dependencies: [
            // Apple
            .product(name: "OrderedCollections", package: "swift-collections"),

            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),

            // 3rd-Party
            .product(name: "Tagged", package: "swift-tagged"),
         ]
      ),
      .target(
         name: "VaporAppFoundation",  // for server-side Vapor applications
         dependencies: [
            // Apple
            .product(name: "OrderedCollections", package: "swift-collections"),

            // Vapor
            .product(name: "Fluent", package: "fluent"),
            .product(name: "Vapor", package: "vapor"),

            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),

            // 3rd-Party
            .product(name: "Tagged", package: "swift-tagged"),
         ]
      ),
      .target(
         name: "TestFoundation",  // for test targets in Apple Platform projects
         dependencies: [
            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),
            
            // 3rd-Party
            .product(name: "CustomDump", package: "swift-custom-dump"),
         ]
      ),
      .target(
         name: "VaporTestFoundation",  // for test targets in server-side Vapor projects
         dependencies: [
            // Vapor
            .product(name: "XCTVapor", package: "vapor"),

            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),

            // 3rd-Party
            .product(name: "CustomDump", package: "swift-custom-dump"),
         ]
      ),
   ]
)
