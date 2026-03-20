import SwiftUI

/// Flux Design System — Color tokens
public enum FluxColors {

    // MARK: - Brand

    /// Primary brand color (Blue)
    public static let primary = Color(hex: 0x007AFF)

    /// Secondary brand color (Navy)
    public static let secondary = Color(hex: 0x1C2541)

    /// Accent color (Teal)
    public static let accent = Color(hex: 0x5BC0BE)

    // MARK: - Surfaces

    #if canImport(UIKit)
    public static let background = Color(.systemBackground)
    public static let surface = Color(.secondarySystemBackground)
    #else
    public static let background = Color(nsColor: .windowBackgroundColor)
    public static let surface = Color(nsColor: .controlBackgroundColor)
    #endif

    // MARK: - Text

    #if canImport(UIKit)
    public static let textPrimary = Color(.label)
    public static let textSecondary = Color(.secondaryLabel)
    #else
    public static let textPrimary = Color(nsColor: .labelColor)
    public static let textSecondary = Color(nsColor: .secondaryLabelColor)
    #endif

    // MARK: - Semantic

    public static let success = Color(hex: 0x34C759)
    public static let warning = Color(hex: 0xFF9500)
    public static let error = Color(hex: 0xFF3B30)

    // MARK: - Borders

    #if canImport(UIKit)
    public static let border = Color(.separator)
    public static let divider = Color(.opaqueSeparator)
    #else
    public static let border = Color(nsColor: .separatorColor)
    public static let divider = Color(nsColor: .gridColor)
    #endif
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
