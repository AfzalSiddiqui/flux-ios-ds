import SwiftUI
import Combine

/// Manages runtime theme switching across the app.
public final class FluxThemeManager: ObservableObject {

    /// The currently active theme.
    @Published public var currentTheme: any FluxThemeProtocol

    /// The current color scheme preference.
    @Published public var colorScheme: ColorScheme?

    /// Shared singleton instance.
    public static let shared = FluxThemeManager()

    public init(theme: any FluxThemeProtocol = FluxDefaultTheme()) {
        self.currentTheme = theme
        self.colorScheme = nil
    }

    /// Switch to a new theme at runtime.
    public func setTheme(_ theme: any FluxThemeProtocol) {
        currentTheme = theme
    }

    /// Toggle between light and dark mode.
    public func toggleColorScheme() {
        switch colorScheme {
        case .light:
            colorScheme = .dark
        case .dark:
            colorScheme = .light
        default:
            colorScheme = .dark
        }
    }

    /// Reset to system color scheme.
    public func useSystemColorScheme() {
        colorScheme = nil
    }
}

// MARK: - Environment Key

private struct FluxThemeKey: EnvironmentKey {
    static let defaultValue: any FluxThemeProtocol = FluxDefaultTheme()
}

public extension EnvironmentValues {
    var fluxTheme: any FluxThemeProtocol {
        get { self[FluxThemeKey.self] }
        set { self[FluxThemeKey.self] = newValue }
    }
}

// MARK: - View Modifier

public extension View {
    /// Applies the Flux theme to the view hierarchy.
    func fluxTheme(_ manager: FluxThemeManager) -> some View {
        self
            .environmentObject(manager)
            .environment(\.fluxTheme, manager.currentTheme)
            .preferredColorScheme(manager.colorScheme)
    }
}
