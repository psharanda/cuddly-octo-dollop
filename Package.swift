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
            url: "https://github.com/psharanda/cuddly-octo-dollop/releases/download/1.0.0/Superduper.xcframework.zip",
            checksum: "48de5e19ee1a17fce0d017966e8c03ccf841f27525f0e760edfc06736e83e947"
        )
    ]
)
