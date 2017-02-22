import PackageDescription

let package = Package(
    name: "MusicNotationKit",
    dependencies: [
        .Package(url: "https://github.com/drumnkyle/music-notation-core.git", majorVersion: 0),
        .Package(url: "https://github.com/apple/swift-protobuf.git", Version(0,9,26))
    ],
    exclude: ["Proto", "Bin"]
)
