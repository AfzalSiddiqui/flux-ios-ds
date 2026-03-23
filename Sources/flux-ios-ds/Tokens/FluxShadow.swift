import SwiftUI

/// Flux Design System — Shadow tokens
public struct FluxShadow {
    public let color: Color
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }

    // MARK: - Presets

    public static let small = FluxShadow(
        color: .black.opacity(0.08),
        radius: 4,
        x: 0,
        y: 2
    )

    public static let medium = FluxShadow(
        color: .black.opacity(0.12),
        radius: 8,
        x: 0,
        y: 4
    )

    public static let large = FluxShadow(
        color: .black.opacity(0.16),
        radius: 16,
        x: 0,
        y: 8
    )
}

// MARK: - View Extension

public extension View {
    func fluxShadow(_ shadow: FluxShadow) -> some View {
        self.shadow(
            color: shadow.color,
            radius: shadow.radius,
            x: shadow.x,
            y: shadow.y
        )
    }
}
