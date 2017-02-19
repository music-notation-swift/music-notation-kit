import PackageDescription

let package = Package(
    name: "MusicNotationKit",
    dependencies: [
        .Package(url: "https://github.com/drumnkyle/music-notation-core.git", majorVersion: 0)
    ]
)
