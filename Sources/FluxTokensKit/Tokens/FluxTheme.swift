import SwiftUI

/// Defines a complete set of design tokens for a theme.
public protocol FluxThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var accent: Color { get }
    var background: Color { get }
    var surface: Color { get }
    var textPrimary: Color { get }
    var textSecondary: Color { get }
    var success: Color { get }
    var warning: Color { get }
    var error: Color { get }
    var border: Color { get }
    var divider: Color { get }
}

/// Default Flux theme using the standard token values.
public struct FluxDefaultTheme: FluxThemeProtocol {
    public init() {}

    public var primary: Color { FluxColors.primary }
    public var secondary: Color { FluxColors.secondary }
    public var accent: Color { FluxColors.accent }
    public var background: Color { FluxColors.background }
    public var surface: Color { FluxColors.surface }
    public var textPrimary: Color { FluxColors.textPrimary }
    public var textSecondary: Color { FluxColors.textSecondary }
    public var success: Color { FluxColors.success }
    public var warning: Color { FluxColors.warning }
    public var error: Color { FluxColors.error }
    public var border: Color { FluxColors.border }
    public var divider: Color { FluxColors.divider }
}

/// An alternative brand theme to demonstrate multi-app theming.
public struct FluxDarkBrandTheme: FluxThemeProtocol {
    public init() {}

    public var primary: Color { Color(hex: 0x6C63FF) }
    public var secondary: Color { Color(hex: 0x2D2B55) }
    public var accent: Color { Color(hex: 0xF78166) }
    public var background: Color { Color(hex: 0x1A1A2E) }
    public var surface: Color { Color(hex: 0x16213E) }
    public var textPrimary: Color { .white }
    public var textSecondary: Color { Color.white.opacity(0.7) }
    public var success: Color { Color(hex: 0x00C897) }
    public var warning: Color { Color(hex: 0xFFB347) }
    public var error: Color { Color(hex: 0xFF6B6B) }
    public var border: Color { Color.white.opacity(0.15) }
    public var divider: Color { Color.white.opacity(0.1) }
}
