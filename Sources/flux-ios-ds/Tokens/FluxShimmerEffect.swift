import SwiftUI

/// Flux Design System — Shimmer/skeleton loading effect token
///
/// Mirrors the `.fluxShadow()` pattern: a lightweight `ViewModifier` +
/// `View` extension that any component can opt into without touching its
/// ViewModel. When active the original content is hidden (frame preserved)
/// and replaced by an animated gradient sweep.

// MARK: - Shimmer View Modifier

/// Internal modifier that drives the shimmer animation.
///
/// - Hides content with `opacity(0)` while preserving its frame
/// - Fills with a `FluxColors.border`-based placeholder
/// - Sweeps a `LinearGradient` highlight left→right on a 1.5 s linear loop
/// - Clips to a `RoundedRectangle` and disables user interaction
struct FluxShimmerModifier: ViewModifier {

    /// Whether the shimmer overlay is currently displayed.
    let active: Bool

    /// Corner radius applied to the placeholder rectangle.
    let cornerRadius: CGFloat

    /// Drives the horizontal translation of the gradient highlight (–1 → 1).
    @State private var phase: CGFloat = -1

    func body(content: Content) -> some View {
        if active {
            content
                .opacity(0)                               // hide content, keep frame
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(FluxColors.border.opacity(0.3))
                        .overlay(
                            LinearGradient(
                                colors: [
                                    .clear,
                                    FluxColors.surface.opacity(0.6),
                                    .clear
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .offset(x: phase * 200)       // animated sweep
                        )
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                )
                .onAppear {
                    withAnimation(
                        .linear(duration: 1.5)
                        .repeatForever(autoreverses: false)
                    ) {
                        phase = 1
                    }
                }
                .disabled(true)                            // block interaction while loading
                .accessibilityLabel("Loading")
        } else {
            content                                        // pass-through when inactive
        }
    }
}

// MARK: - View Extension

public extension View {

    /// Applies a shimmer/skeleton loading effect over the view.
    ///
    /// When `active` is `true`, the view's content is hidden (but its frame
    /// is preserved) and replaced with an animated gradient sweep — ideal for
    /// showing placeholder UI while data loads.
    ///
    /// - Parameters:
    ///   - active: `true` to show the shimmer overlay; `false` to pass the view through unchanged.
    ///   - cornerRadius: Corner radius for the placeholder shape. Defaults to `FluxRadius.sm`.
    /// - Returns: The original view with an optional shimmer overlay.
    ///
    /// ```swift
    /// FluxButton(viewModel: vm).fluxShimmer(active: isLoading)
    /// FluxCard(viewModel: vm) { content }
    ///     .fluxShimmer(active: isLoading, cornerRadius: FluxRadius.lg)
    /// ```
    func fluxShimmer(active: Bool = true, cornerRadius: CGFloat = FluxRadius.sm) -> some View {
        modifier(FluxShimmerModifier(active: active, cornerRadius: cornerRadius))
    }
}
