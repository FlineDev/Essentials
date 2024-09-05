// swift-tools-version: 5.8
import PackageDescription

let package = Package(
   name: "Essentials",
   platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
   products: [
      .library(name: "SwiftUIPlus", targets: ["SwiftUIPlus"]),
      .library(name: "FoundationPlus", targets: ["FoundationPlus"]),
   ],
   dependencies: [
      // Apple
      .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.4"),

      // FlineDev
      .package(url: "https://github.com/FlineDev/FreemiumKit.git", from: "1.7.1"),
      .package(url: "https://github.com/FlineDev/HandySwift.git", branch: "main"),
      .package(url: "https://github.com/FlineDev/HandySwiftUI.git", branch: "main"),
      .package(url: "https://github.com/FlineDev/ReviewKit.git", branch: "main"),

      // 3rd-Party
      .package(url: "https://github.com/nonstrict-hq/CloudStorage.git", from: "0.5.0"),
      .package(url: "https://github.com/pointfreeco/swift-identified-collections.git", from: "1.0.0"),
      .package(url: "https://github.com/TelemetryDeck/SwiftSDK.git", from: "2.3.0"),
   ],
   targets: [
      .target(
         name: "SwiftUIPlus",  // for Apple Platform applications using SwiftUI (like iOS, macOS, or visionOS)
         dependencies: [
            // Package
            "FoundationPlus",
      
            // FlineDev
            .product(name: "FreemiumKit", package: "FreemiumKit"),
            .product(name: "HandySwift", package: "HandySwift"),
            .product(name: "HandySwiftUI", package: "HandySwiftUI"),
            .product(name: "ReviewKit", package: "ReviewKit"),

            // 3rd-Party
            .product(name: "CloudStorage", package: "CloudStorage"),
            .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
            .product(name: "TelemetryDeck", package: "SwiftSDK"),
         ]
      ),
      .target(
         name: "FoundationPlus",  // for code not directly related to a SwiftUI application target like tests or servers
         dependencies: [
            // Apple
            .product(name: "OrderedCollections", package: "swift-collections"),

            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),
         ]
      ),
   ]
)
