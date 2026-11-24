// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "TaurusxAppLovinAdapter",
    platforms: [.iOS("12.0")],

    products: [
        .library(
            name: "TaurusxAppLovinAdapter",
            targets: ["TaurusxAppLovinAdapterTarget"]
        )
    ],

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
        .target(
            name: "TaurusxAppLovinAdapterTarget",
            dependencies: [
                .target(name: "TaxAppLovinAdapter"),
                .product(
                    name: "TaurusxAdsSDK",
                    package: "spm_test"
                ),
                .product(
                    name: "AppLovinSDK",
                    package: "AppLovin-MAX-Swift-Package"
                )
            ],
            path: "TaurusxAppLovinAdapterTarget"
        ),
        .binaryTarget(
            name: "TaxAppLovinAdapter",
            url: "https://github.com/lee-tax/max-adapter-swift-package-test/releases/download/1.2.0/TaxAppLovinAdapter.zip",
            checksum: "69e1b2dc686e7018f82909d54b1c7054c5baabe08f42a57ae87669712617508f"
        )
    ]
)
