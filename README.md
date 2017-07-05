
<p align="center">
  <a href="https://cocoapods.org/pods/NAIManager">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-brightgreen.svg">
  <img alt="Author" src="https://img.shields.io/badge/author-Meniny-blue.svg">
  <img alt="Build Passing" src="https://img.shields.io/badge/build-passing-brightgreen.svg">
  <img alt="Swift" src="https://img.shields.io/badge/swift-3.0%2B-orange.svg">
  <br/>
  <img alt="Platforms" src="https://img.shields.io/badge/platform-iOS-lightgrey.svg">
  <img alt="MIT" src="https://img.shields.io/badge/license-MIT-blue.svg">
  <br/>
  <img alt="Cocoapods" src="https://img.shields.io/badge/cocoapods-compatible-brightgreen.svg">
  <img alt="Carthage" src="https://img.shields.io/badge/carthage-working%20on-red.svg">
  <img alt="SPM" src="https://img.shields.io/badge/swift%20package%20manager-working%20on-red.svg">
  </a>
</p>

***

# Introduction

## What's this?

`NetworkActivityIndicatorManager`(aka `NAIManager`) is a Network Activity Indicator Manager for iOS.

## Requirements

* iOS 8.0+

## Installation

#### CocoaPods

```ruby
pod 'NAIManager'
```

## Contribution

You are welcome to fork and submit pull requests.

## License

`NAIManager` is open-sourced software, licensed under the `MIT` license.

## Usage

```swift
let url = "https://meniny.cn/test.json"
let params = ["type": 1]

NAIManager.operationStarted()

NetworkingFramework.request(url, params: params) { result in

    NAIManager.operationFinished()
    // code ...
}
```
