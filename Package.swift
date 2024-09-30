// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SCCameraKit",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "SCSDKCameraKit", targets: ["SCSDKCameraKit"]),
        .library(name: "SCSDKCameraKitBaseExtension", targets: ["SCSDKCameraKitBaseExtension"]),
        .library(name: "SCSDKCameraKitLoginKitAuth", targets: ["SCSDKCameraKitLoginKitAuth"]),
        .library(name: "SCSDKCameraKitPushToDeviceExtension", targets: ["SCSDKCameraKitPushToDeviceExtension"]),
        .library(name: "SCCameraKitReferenceUI", targets: ["SCCameraKitReferenceUI"]),
        .library(name: "SCCameraKitReferenceSwiftUI", targets: ["SCCameraKitReferenceSwiftUI"]),
        
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SCSDKCameraKit",
            url: "https://github.com/psharanda/cuddly-octo-dollop/releases/download/1.34.2/SCSDKCameraKit.xcframework.zip",
            checksum: "c78e41dfc0ece785f262fc6813bc86f6b6258371842a49002fe5f977ff47188b"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitBaseExtension",
            url: "https://github.com/psharanda/cuddly-octo-dollop/releases/download/1.34.2/SCSDKCameraKitBaseExtension.xcframework.zip",
            checksum: "e50b178345d89e87cdf7901df62265fa1d0cefbdc744121a979862a62d926ff3"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitLoginKitAuth",
            url: "https://github.com/psharanda/cuddly-octo-dollop/releases/download/1.34.2/SCSDKCameraKitLoginKitAuth.xcframework.zip",
            checksum: "924e10fd37e9407638020451be91ae275dad89a1482b05c1aac0496abe73fe41"
        ),
        .binaryTarget(
            name: "SCSDKCameraKitPushToDeviceExtension",
            url: "https://github.com/psharanda/cuddly-octo-dollop/releases/download/1.34.2/SCSDKCameraKitPushToDeviceExtension.xcframework.zip",
            checksum: "937b82e8c36dd6bb15e1ade7117e4165c7d416b9d5e8e2d83fa04489a3c69e3f"
        ),
        .target(name: "SCCameraKitReferenceUI", dependencies: ["SCSDKCameraKit"], path: "Sources/SCCameraKitReferenceUI"),
        .target(name: "SCCameraKitReferenceSwiftUI", dependencies: ["SCCameraKitReferenceUI"], path: "Sources/SCCameraKitReferenceSwiftUI")
    ]
)
