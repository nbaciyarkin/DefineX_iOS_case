// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum LocalizationKeys {
  /// E-mail
  internal static let emailPlaceholderTitle = LocalizationKeys.tr("Localizable", "email-placeholder_title", fallback: "E-mail")
  /// E-mail address
  internal static let emailInfoTitle = LocalizationKeys.tr("Localizable", "email_info_title", fallback: "E-mail address")
  /// Error
  internal static let errorTitle = LocalizationKeys.tr("Localizable", "error_title", fallback: "Error")
  /// I FORGOT MY PASS
  internal static let forgotPassButtonTitle = LocalizationKeys.tr("Localizable", "forgot_pass_button_title", fallback: "I FORGOT MY PASS")
  /// Localizable.strings
  ///   DefineX
  /// 
  ///   Created by Yarkın Gazibaba on 2.08.2023.
  internal static let generalComingSoonTitle = LocalizationKeys.tr("Localizable", "general_coming_soon_title", fallback: "Coming Soon")
  /// Home
  internal static let headerLabelTitle = LocalizationKeys.tr("Localizable", "header_label_title", fallback: "Home")
  /// LOGIN
  internal static let loginButtonTitle = LocalizationKeys.tr("Localizable", "login_button_title", fallback: "LOGIN")
  /// Password
  internal static let passwordPlaceholderTitle = LocalizationKeys.tr("Localizable", "password-placeholder_title", fallback: "Password")
  /// Password
  internal static let passwordInfoTitle = LocalizationKeys.tr("Localizable", "password_info_title", fallback: "Password")
  /// Succesful
  internal static let successfulTitle = LocalizationKeys.tr("Localizable", "successful_title", fallback: "Succesful")
  /// Discover
  internal static let tabbarFirstItemTitle = LocalizationKeys.tr("Localizable", "tabbar_first_item_title", fallback: "Discover")
  /// Warning
  internal static let warningTitle = LocalizationKeys.tr("Localizable", "warning_title", fallback: "Warning")
  /// Definex Case Study
  internal static let welcomeMessage = LocalizationKeys.tr("Localizable", "welcome_message", fallback: "Definex Case Study")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension LocalizationKeys {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
