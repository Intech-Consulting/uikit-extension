#if canImport(UIKit)
import UIKit

extension UIWindow {
    public func reload() {
        subviews.forEach { view in
            view.removeFromSuperview()
            addSubview(view)
        }
    }
}

extension Array where Element == UIWindow {
    public func reload() {
        forEach { $0.reload() }
    }
}
#endif
