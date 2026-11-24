// swift-tools-version: 5.6
// 由 TaurusX Publisher 根据页面配置生成。

import PackageDescription

let package = Package(
    // 包名称。
    name: "TaurusxAppLovinAdapter",
    // 最低 iOS 版本，需同时满足 Adapter 和两个 SDK 的要求。
    platforms: [.iOS("12.0")],

    // 对外提供的产品：开发者在 Xcode 中选择的 library。
    products: [
        .library(
            name: "TaurusxAppLovinAdapter",
            targets: ["TaurusxAppLovinAdapterTarget"]
        )
    ],

    // 第一处 dependencies：外部 SDK 包的仓库和版本规则。
    dependencies: [
        .package(
            url: "https://github.com/lee-tax/spm_test.git",
            exact: "1.1.0"
        ),
        .package(
            url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
            exact: "13.0.0"
        )
    ],

    targets: [
        // 普通 Target：将 Adapter 二进制和两个 SDK 组合起来。
        .target(
            name: "TaurusxAppLovinAdapterTarget",
            // 第二处 dependencies：当前 Target 实际使用的三个组件。
            dependencies: [
                .target(name: "TaxAppLovinAdapter"),
                // 核心 SDK 提供的产品。
                .product(
                    name: "TaurusxAdsSDK",
                    package: "spm_test"
                ),
                // 广告平台 SDK 提供的产品。
                .product(
                    name: "AppLovinSDK",
                    package: "AppLovin-MAX-Swift-Package"
                )
            ],
            path: "Sources"
        ),
        // Adapter 二进制：下载地址指向实际发布的 XCFramework ZIP。
        .binaryTarget(
            name: "TaxAppLovinAdapter",
            url: "https://github.com/lee-tax/max-adapter-swift-package-test/releases/download/1.1.0/TaxAppLovinAdapter.zip",
            // 根据上述 ZIP 的实际内容计算 SHA-256。
            checksum: "69e1b2dc686e7018f82909d54b1c7054c5baabe08f42a57ae87669712617508f"
        )
    ]
)
