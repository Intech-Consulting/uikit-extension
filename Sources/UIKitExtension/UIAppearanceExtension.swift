#if canImport(UIKit)
import UIKit

extension UIAppearance {
    @discardableResult
    public func style(_ styleClosure: (Self) -> Swift.Void) -> Self {
        styleClosure(self)
        return self
    }
}
#endif
