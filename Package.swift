// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NotationView",
    products: [
        .library(name: "PlotView", targets: ["PlotView"]),
//         .library(name: "StaffModel", targets: ["StaffModel"]),
        .library(name: "StaffView", targets: ["StaffView", "StaffModel"]),
        .library(name: "RhythmView", targets: ["RhythmView"]),
        .library(name: "ScoreView", targets: ["ScoreView"]),
        
    ],
    dependencies: [
       .package(url: "https://github.com/dn-m/Graphics", from: "0.4.1"),
//        .package(url: "https://github.com/dn-m/NotationModel", from: "0.9.0")
    ],
    targets: [

        // Sources
//         .target(name: "StaffModel", dependencies: ["StaffView"]),
        .target(name: "PlotView", dependencies: ["PlotModel", "Rendering"]),
        .target(name: "StaffView", dependencies: ["PlotView", "StaffModel"]),
        .target(name: "RhythmView", dependencies: ["SpelledRhythm", "SpelledPitch", "Rendering"]),

        .target(
            name: "ScoreView",
            dependencies: [
                "Rendering",
                "PlotView",
                "StaffView",
                "RhythmView",
            ]
        ),

        // Tests
        .testTarget(name: "PlotViewTests", dependencies: ["PlotView", "GraphicsTesting"]),
        .testTarget(
            name: "StaffViewTests",
            dependencies: [
                "StaffView",
                "QuartzAdapter",
                "GraphicsTesting"
            ]
        ),
        .testTarget(name: "RhythmViewTests", dependencies: ["RhythmView", "GraphicsTesting"]),
        .testTarget(name: "ScoreViewTests", dependencies: ["ScoreView", "GraphicsTesting"])
    ]
)
