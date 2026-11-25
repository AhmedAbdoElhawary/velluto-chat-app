import SwiftUI

/// on ShapeStyle so both `Color.vAccent` and `.foregroundStyle(.vAccent)` work
public extension ShapeStyle where Self == Color {
    static var vBackground: Color { Color(.vBackground) }
    static var vSurface: Color { Color(.vSurface) }
    static var vRaised: Color { Color(.vRaised) }
    static var vReceived: Color { Color(.vReceived) }
    static var vHairline: Color { Color(.vHairline) }
    static var vAccent: Color { Color(.vAccent) }
    static var vOnAccent: Color { Color(.vOnAccent) }
    static var vTextPrimary: Color { Color(.vTextPrimary) }
    static var vTextSecondary: Color { Color(.vTextSecondary) }
    static var vGlow: Color { Color(.vGlow) }
}
