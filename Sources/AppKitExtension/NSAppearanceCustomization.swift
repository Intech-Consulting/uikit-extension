#if canImport(NSAppearanceCustomization)
import NSAppearanceCustomization

extension NSAppearanceCustomization {
    @discardableResult
    public func style(_ styleClosure: (Self) -> Swift.Void) -> Self {
        styleClosure(self)
        return self
    }
}
#endif
