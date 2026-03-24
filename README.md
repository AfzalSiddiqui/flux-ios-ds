# flux-ios-ds

**Design tokens for the Flux iOS Design System.** Build your app's visual foundation once and reuse it everywhere.

`flux-ios-ds` is the base layer of the Flux Design System. It defines every visual property — colors, typography, spacing, shadows, borders, opacity, and theming — as **type-safe Swift tokens**. No hard-coded magic numbers.

---

## Features

- **16 semantic color tokens** — Brand, surface, text, semantic, border, overlay
- **11 typography styles** — Display, heading, body, code with system fonts
- **8-step spacing scale** — From 2pt (xxxs) to 48pt (xxl)
- **6 corner radius presets** — xs through full (pill)
- **3 shadow elevations** — Small, medium, large with view modifier
- **3 border widths** — Thin, medium, thick
- **5 opacity presets** — Subtle, light, muted, overlay, disabled
- **Shimmer effect** — Animated gradient sweep for skeleton loading
- **Runtime theme switching** — Protocol-based, swap themes without touching components
- **Light/Dark mode** — Native support + custom color scheme toggle

---

## Installation

Add as a local SPM dependency:

```swift
// Package.swift
dependencies: [
    .package(path: "../flux-ios-ds")
]
```

```swift
import flux_ios_ds
```

> **Note:** If you use `flux-ios-foundation`, it re-exports `flux_ios_ds` automatically via `@_exported import`.

---

## Token Reference

### Colors (FluxColors)

| Category | Tokens |
|----------|--------|
| Brand | `primary`, `secondary`, `accent` |
| Surface | `background`, `surface` |
| Text | `textPrimary`, `textSecondary` |
| Semantic | `success`, `warning`, `error` |
| Border | `border`, `divider` |
| On-Colors | `onPrimary`, `onSecondary`, `onError` |
| Overlay | `overlay` |

```swift
Text("Hello").foregroundColor(FluxColors.textPrimary)
VStack { }.background(FluxColors.background)
```

### Typography (FluxTypography)

| Style | Usage |
|-------|-------|
| `largeTitle` | Hero headings |
| `title`, `title2`, `title3` | Section titles |
| `headline` | Emphasized labels |
| `subheadline` | Supporting text |
| `body` | Main content |
| `callout` | Highlighted info |
| `footnote`, `caption` | Small text |
| `code` | Monospaced content |

```swift
Text("Title").font(FluxTypography.title.font)
```

### Spacing (FluxSpacing)

| Token | Value | Usage |
|-------|-------|-------|
| `xxxs` | 2pt | Hairline gaps |
| `xxs` | 4pt | Tight padding |
| `xs` | 8pt | Small gaps |
| `sm` | 12pt | Compact padding |
| `md` | 16pt | Default padding |
| `lg` | 24pt | Section spacing |
| `xl` | 32pt | Large gaps |
| `xxl` | 48pt | Page margins |

```swift
VStack(spacing: FluxSpacing.md) { ... }
.padding(FluxSpacing.lg)
```

### Radius (FluxRadius)

| Token | Value |
|-------|-------|
| `xs` | 4pt |
| `sm` | 8pt |
| `md` | 12pt |
| `lg` | 16pt |
| `xl` | 24pt |
| `full` | 9999pt (pill) |

### Shadow (FluxShadow)

| Preset | Blur | Offset |
|--------|------|--------|
| `small` | 4px | 2pt |
| `medium` | 8px | 4pt |
| `large` | 16px | 8pt |

```swift
Card().fluxShadow(.medium)
```

### Border (FluxBorder)

| Token | Value |
|-------|-------|
| `thin` | 1pt |
| `medium` | 1.5pt |
| `thick` | 2pt |

### Opacity (FluxOpacity)

| Token | Value | Usage |
|-------|-------|-------|
| `subtle` | 0.08 | Background tints |
| `light` | 0.1 | Light overlays |
| `muted` | 0.3 | Muted elements |
| `overlay` | 0.4 | Modal backgrounds |
| `disabled` | 0.5 | Disabled states |

---

## Theming

### Switch themes at runtime

```swift
// Use default theme
FluxThemeManager.shared.setTheme(FluxDefaultTheme())

// Switch to dark brand theme
FluxThemeManager.shared.setTheme(FluxDarkBrandTheme())

// Toggle color scheme
FluxThemeManager.shared.colorScheme = .dark
```

### Create a custom theme

```swift
struct MyBrandTheme: FluxThemeProtocol {
    var primary: Color { Color(hex: 0xFF6B35) }
    var secondary: Color { Color(hex: 0x004E89) }
    var accent: Color { Color(hex: 0x00B4D8) }
    var background: Color { .white }
    var surface: Color { Color(hex: 0xF8F9FA) }
    var textPrimary: Color { Color(hex: 0x212529) }
    var textSecondary: Color { Color(hex: 0x6C757D) }
    var success: Color { .green }
    var warning: Color { .orange }
    var error: Color { .red }
    var border: Color { Color(hex: 0xDEE2E6) }
    var divider: Color { Color(hex: 0xE9ECEF) }
    var onPrimary: Color { .white }
    var onSecondary: Color { .white }
    var onError: Color { .white }
    var overlay: Color { .black.opacity(0.4) }
}
```

---

## File Structure

```
flux-ios-ds/
|-- Package.swift
|-- LICENSE
|-- README.md
+-- Sources/flux-ios-ds/
    |-- flux_ios_ds.swift              (module re-export)
    +-- Tokens/
        |-- FluxColors.swift           (16 semantic colors + hex helper)
        |-- FluxTypography.swift       (11 text styles)
        |-- FluxSpacing.swift          (8-step spacing scale)
        |-- FluxRadius.swift           (6 corner radius presets)
        |-- FluxShadow.swift           (3 elevations + view modifier)
        |-- FluxBorder.swift           (3 border widths)
        |-- FluxOpacity.swift          (5 opacity presets)
        |-- FluxShimmerEffect.swift    (skeleton loading modifier)
        |-- FluxTheme.swift            (theme protocol + 2 implementations)
        +-- FluxThemeManager.swift     (singleton theme manager)
```

---

## License

MIT License - Copyright (c) 2026 Afzal Siddiqui
