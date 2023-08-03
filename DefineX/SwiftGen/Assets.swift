// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let adb5Bd = ColorAsset(name: "ADB5BD")
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let _2B2D42 = ColorAsset(name: "2B2D42")
  internal static let _582C83 = ColorAsset(name: "582C83")
  internal static let _8D99Ae = ColorAsset(name: "8D99AE")
  internal static let warningForegroundColor = ColorAsset(name: "warning-foreground-color")
  internal static let accountTabIcon = ImageAsset(name: "account_tab_icon")
  internal static let bookTabIcon = ImageAsset(name: "book_tab_icon")
  internal static let cartTabIcon = ImageAsset(name: "cart_tab_icon")
  internal static let checkmark = ImageAsset(name: "checkmark")
  internal static let discoverTabIcon = ImageAsset(name: "discover_tab_icon")
  internal static let emailIcon = ImageAsset(name: "email_icon")
  internal static let error = ImageAsset(name: "error")
  internal static let grayStarIcon = ImageAsset(name: "gray_star_icon")
  internal static let greenStarIcon = ImageAsset(name: "green_star_icon")
  internal static let infoWarning = ImageAsset(name: "info-warning")
  internal static let lockIcon = ImageAsset(name: "lock_icon")
  internal static let rateIcon = ImageAsset(name: "rate_icon")
  internal static let rightDotImage = ImageAsset(name: "right_dot_image")
  internal static let tagTabIcon = ImageAsset(name: "tag_tab_icon")
  internal static let e03C30 = ColorAsset(name: "E03C30")
  internal static let e6B91E = ColorAsset(name: "E6B91E")
  internal static let e9Ecef = ColorAsset(name: "E9ECEF")
  internal static let f4F4F4 = ColorAsset(name: "F4F4F4")
  internal static let appBlue = ColorAsset(name: "app_blue")
  internal static let appDarkBlue = ColorAsset(name: "app_dark_blue")
  internal static let barItemColorFirst = ColorAsset(name: "bar_item_color_first")
  internal static let barItemColorSecond = ColorAsset(name: "bar_item_color_second")
  internal static let buttonGreenColor1 = ColorAsset(name: "button_green_color1")
  internal static let buttonGreenColor2 = ColorAsset(name: "button_green_color2")
  internal static let darkYellowColor = ColorAsset(name: "dark-yellow-color")
  internal static let discountColor = ColorAsset(name: "discount_color")
  internal static let mainBlack = ColorAsset(name: "mainBlack")
  internal static let mainGray = ColorAsset(name: "mainGray")
  internal static let mainGreen = ColorAsset(name: "mainGreen")
  internal static let mainRed = ColorAsset(name: "mainRed")
  internal static let facebookButtonImage = ImageAsset(name: "facebook_button_image")
  internal static let firstHorizontalImage = ImageAsset(name: "first_horizontal_image")
  internal static let grayStarColor = ColorAsset(name: "gray_star_color")
  internal static let greenStarColor = ColorAsset(name: "green_star_color")
  internal static let leftDotImage = ImageAsset(name: "left_dot_image")
  internal static let loginSelectedColor = ColorAsset(name: "login_selectedColor")
  internal static let mainWhite = ColorAsset(name: "mainWhite")
  internal static let secondHorizontalImage = ImageAsset(name: "second_horizontal_image")
  internal static let twitterButtonImage = ImageAsset(name: "twitter_button_image")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
