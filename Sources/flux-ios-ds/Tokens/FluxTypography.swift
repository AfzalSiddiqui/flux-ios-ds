import SwiftUI

/// Flux Design System — Typography tokens
public enum FluxFont {

    // MARK: - Display

    public static let largeTitle: Font = .system(.largeTitle, weight: .bold)
    public static let title: Font = .system(.title, weight: .bold)
    public static let title2: Font = .system(.title2, weight: .semibold)
    public static let title3: Font = .system(.title3, weight: .semibold)

    // MARK: - Heading

    public static let headline: Font = .system(.headline, weight: .semibold)
    public static let subheadline: Font = .system(.subheadline, weight: .regular)

    // MARK: - Body

    public static let body: Font = .system(.body, weight: .regular)
    public static let callout: Font = .system(.callout, weight: .regular)
    public static let footnote: Font = .system(.footnote, weight: .regular)
    public static let caption: Font = .system(.caption, weight: .regular)
}
