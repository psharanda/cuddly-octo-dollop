// swift-tools-version:5.9

import PackageDescription

let packageName = "Superduper"

let package = Package(
    name: "Superduper",
    platforms: [.iOS(.v17_5)],
    products: [.library(name: "Superduper", targets: ["Superduper"])],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "Superduper",
            url: "https://url/to/some/remote/xcframework.zip",
            checksum: "The checksum of the ZIP archive that contains the XCFramework."
        )
    ]
)
