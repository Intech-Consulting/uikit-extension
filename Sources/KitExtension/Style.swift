#if os(macOS)
import AppKit
public typealias KitView = NSView
#elseif os(iOS)
import UIKit
public typealias KitView = UIView
#endif

public struct Style<View: KitView> {
    public let style: (View) -> Void

    public init(style: @escaping (View) -> Void) {
        self.style = style
    }

    /// Applies self to the view.
    public func apply(to view: View) {
        style(view)
    }

    /// Style that does nothing (keeps the default/native style).
    public static var native: Style<View> {
        Style { _ in }
    }
}

extension Style {
    /// Marges two styles together.
    public func adding<V>(_ other: Style<V>) -> Style {
        Style {
            self.apply(to: $0)
            other.apply(to: $0 as! V) // swiftlint:disable:this force_cast
        }
    }

    /// Returns current style modified by the given closure.
    public func modifying(_ other: @escaping (View) -> Void) -> Style {
        Style {
            self.apply(to: $0)
            other($0)
        }
    }
}

extension KitView {
    /// For example: `let nameLabel = UILabel(style: Stylesheet.Profile.name)`.
    public convenience init<V>(style: Style<V>) {
        self.init(frame: .zero)
        apply(style)
    }

    /// Applies the given style to self.
    public func apply<V>(_ style: Style<V>) {
        guard let view = self as? V else {
            print("💥 Could not apply style for \(V.self) to \(type(of: self))")
            return
        }

        style.apply(to: view)
    }

    /// Returns self with the style applied. For example: `let nameLabel = UILabel().styled(with: Stylesheet.Profile.name)`.
    public func styled<V>(with style: Style<V>) -> Self {
        guard let view = self as? V else {
            print("💥 Could not apply style for \(V.self) to \(type(of: self))")
            return self
        }
        style.apply(to: view)
        return self
    }
}
