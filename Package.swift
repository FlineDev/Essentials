// swift-tools-version: 5.9
import PackageDescription

let package = Package(
   name: "Foundation",
   products: [
      .library(name: "AppFoundation", targets: ["AppFoundation"]),
      .library(name: "TestFoundation", targets: ["TestFoundation"]),
   ],
   dependencies: [
      // Apple
      .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.4"),

      // FlineDev
      .package(url: "https://github.com/FlineDev/HandySwift.git", branch: "main"),
      .package(url: "https://github.com/FlineDev/HandySwiftUI.git", branch: "main"),
      .package(url: "https://github.com/FlineDev/ReviewKit.git", branch: "main"),

      // 3rd-Party
      .package(url: "https://github.com/pointfreeco/swift-custom-dump.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.0.0"),
      .package(url: "https://github.com/pointfreeco/swift-identified-collections.git", from: "1.0.0"),
   ],
   targets: [
      .target(
         name: "AppFoundation",
         dependencies: [
            // Apple
            .product(name: "OrderedCollections", package: "swift-collections"),
      
            // FlineDev
            .product(name: "HandySwift", package: "HandySwift"),
            .product(name: "HandySwiftUI", package: "HandySwiftUI"),
            .product(name: "ReviewKit", package: "ReviewKit"),

            // 3rd-Party
            .product(name: "Dependencies", package: "swift-dependencies"),
            .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
         ]
      ),
      .target(
         name: "TestFoundation",
         dependencies: [
            // 3rd-Party
            .product(name: "CustomDump", package: "swift-custom-dump"),
         ]
      ),
   ]
)
