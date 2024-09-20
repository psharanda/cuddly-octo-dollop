// swift-tools-version:5.9

import PackageDescription

let packageName = "Superduper"

let package = Package(
    name: "Superduper",
    platforms: [.iOS(.v17)],
    products: [.library(name: "Superduper", targets: ["Superduper"])],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "Superduper",
            url: "https://github.com/psharanda/cuddly-octo-dollop/releases/download/2.0.0/Superduper.xcframework.zip",
            checksum: "3fd042f3c58305b5827b8f1b0d490829ba40a87578524f33f43242fa499022af"
        )
    ]
)
