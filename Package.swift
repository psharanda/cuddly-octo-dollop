// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SCCameraKit",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "SCSDKCameraKit", targets: ["SCSDKCameraKit"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SCSDKCameraKit",
            url: "https://github.com/psharanda/cuddly-octo-dollop/releases/download/1.33.0/SCSDKCameraKit.xcframework.zip",
            checksum: "61374aee91d2e2f858e1a05a487bfe0af5c8a4da2da8b006114005134e795111"
        )
    ]
)
