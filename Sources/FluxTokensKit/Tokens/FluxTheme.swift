import SwiftUI

/// Defines a complete set of design tokens for a theme.
public protocol FluxThemeProtocol {
    // Brand
    var primary: Color { get }
    var secondary: Color { get }
    var accent: Color { get }

    // Surfaces
    var background: Color { get }
    var surface: Color { get }

    // Text
    var textPrimary: Color { get }
    var textSecondary: Color { get }

    // Semantic
    var success: Color { get }
    var warning: Color { get }
    var error: Color { get }

    // Borders
    var border: Color { get }
    var divider: Color { get }

    // On-colors (foreground on filled backgrounds)
    var onPrimary: Color { get }
    var onSecondary: Color { get }
    var onError: Color { get }

    // Overlay
    var overlay: Color { get }
}

/// Default Flux theme — defines colors directly (no FluxColors reference).
public struct FluxDefaultTheme: FluxThemeProtocol {
    public init() {}

    // Brand
    public var primary: Color { Color(hex: 0x007AFF) }
    public var secondary: Color { Color(hex: 0x1C2541) }
    public var accent: Color { Color(hex: 0x5BC0BE) }

    // Surfaces
    #if canImport(UIKit)
    public var background: Color { Color(.systemBackground) }
    public var surface: Color { Color(.secondarySystemBackground) }
    #else
    public var background: Color { Color(nsColor: .windowBackgroundColor) }
    public var surface: Color { Color(nsColor: .controlBackgroundColor) }
    #endif

    // Text
    #if canImport(UIKit)
    public var textPrimary: Color { Color(.label) }
    public var textSecondary: Color { Color(.secondaryLabel) }
    #else
    public var textPrimary: Color { Color(nsColor: .labelColor) }
    public var textSecondary: Color { Color(nsColor: .secondaryLabelColor) }
    #endif

    // Semantic
    public var success: Color { Color(hex: 0x34C759) }
    public var warning: Color { Color(hex: 0xFF9500) }
    public var error: Color { Color(hex: 0xFF3B30) }

    // Borders
    #if canImport(UIKit)
    public var border: Color { Color(.separator) }
    public var divider: Color { Color(.opaqueSeparator) }
    #else
    public var border: Color { Color(nsColor: .separatorColor) }
    public var divider: Color { Color(nsColor: .gridColor) }
    #endif

    // On-colors
    public var onPrimary: Color { .white }
    public var onSecondary: Color { .white }
    public var onError: Color { .white }

    // Overlay
    public var overlay: Color { Color.black.opacity(0.4) }
}

/// An alternative brand theme to demonstrate multi-app theming.
public struct FluxDarkBrandTheme: FluxThemeProtocol {
    public init() {}

    // Brand
    public var primary: Color { Color(hex: 0x6C63FF) }
    public var secondary: Color { Color(hex: 0x2D2B55) }
    public var accent: Color { Color(hex: 0xF78166) }

    // Surfaces
    public var background: Color { Color(hex: 0x1A1A2E) }
    public var surface: Color { Color(hex: 0x16213E) }

    // Text
    public var textPrimary: Color { .white }
    public var textSecondary: Color { Color.white.opacity(0.7) }

    // Semantic
    public var success: Color { Color(hex: 0x00C897) }
    public var warning: Color { Color(hex: 0xFFB347) }
    public var error: Color { Color(hex: 0xFF6B6B) }

    // Borders
    public var border: Color { Color.white.opacity(0.15) }
    public var divider: Color { Color.white.opacity(0.1) }

    // On-colors
    public var onPrimary: Color { .white }
    public var onSecondary: Color { .white }
    public var onError: Color { .white }

    // Overlay
    public var overlay: Color { Color.black.opacity(0.5) }
}
