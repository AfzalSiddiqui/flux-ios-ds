import SwiftUI

/// Flux Design System — Color tokens
///
/// All colors read from `FluxThemeManager.shared.currentTheme` so they
/// automatically update when the theme changes. For rebranding, create
/// a new `FluxThemeProtocol` conforming struct and call
/// `FluxThemeManager.shared.setTheme(YourBrandTheme())`.
public enum FluxColors {

    // MARK: - Brand

    public static var primary: Color { FluxThemeManager.shared.currentTheme.primary }
    public static var secondary: Color { FluxThemeManager.shared.currentTheme.secondary }
    public static var accent: Color { FluxThemeManager.shared.currentTheme.accent }

    // MARK: - Surfaces

    public static var background: Color { FluxThemeManager.shared.currentTheme.background }
    public static var surface: Color { FluxThemeManager.shared.currentTheme.surface }

    // MARK: - Text

    public static var textPrimary: Color { FluxThemeManager.shared.currentTheme.textPrimary }
    public static var textSecondary: Color { FluxThemeManager.shared.currentTheme.textSecondary }

    // MARK: - Semantic

    public static var success: Color { FluxThemeManager.shared.currentTheme.success }
    public static var warning: Color { FluxThemeManager.shared.currentTheme.warning }
    public static var error: Color { FluxThemeManager.shared.currentTheme.error }

    // MARK: - Borders

    public static var border: Color { FluxThemeManager.shared.currentTheme.border }
    public static var divider: Color { FluxThemeManager.shared.currentTheme.divider }

    // MARK: - On-colors (foreground on filled backgrounds)

    public static var onPrimary: Color { FluxThemeManager.shared.currentTheme.onPrimary }
    public static var onSecondary: Color { FluxThemeManager.shared.currentTheme.onSecondary }
    public static var onError: Color { FluxThemeManager.shared.currentTheme.onError }

    // MARK: - Overlay

    public static var overlay: Color { FluxThemeManager.shared.currentTheme.overlay }
}

// MARK: - Hex Initializer

public extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
