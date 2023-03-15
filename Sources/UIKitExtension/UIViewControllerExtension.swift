#if canImport(UIKit)
import UIKit

/// Extension for add & remove UIViewController in container
extension UIViewController {
    // MARK: - New Methods

    /// Add children view controller in rootViewController coordinator
    ///
    /// - Parameter childViewController: View controller will add in rootViewController of coordinator
    /// - Parameter completion: Run callback
    public func addFullScreen(childViewController child: UIViewController, completion: (() -> Swift.Void)? = nil) {
        guard child.parent == nil else {
            return
        }

        addChild(child)
        view.addSubview(child.view)

        child.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            view.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: child.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
        ]

        constraints.forEach { $0.isActive = true }
        view.addConstraints(constraints)

        child.didMove(toParent: self)

        completion?()
    }

    /// Remove children view controller in rootViewController
    ///
    /// - Parameter childViewController: View controller will add in rootViewController of coordinator
    public func remove(childViewController child: UIViewController?) {
        guard let child = child else {
            return
        }

        guard child.parent != nil else {
            return
        }

        child.willMove(toParent: child)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

    // MARK: - Old Methods

    /**
     Add children view controller in rootViewController coordinator

     - Parameters:
     - children: View controller will add in rootViewController of coordinator
     - bounds: Size of view in view of rootViewController coodrinator
     - completion: completion run after add children view controller
     */
    public func addChild(_ child: UIViewController, bounds: CGRect? = nil, completion: (() -> Swift.Void)? = nil) {
        guard child.parent == nil else {
            return
        }

        // Add Child View Controller
        addChild(child)

        // Configure Child View
        child.view.frame = bounds ?? view.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Add Child View as Subview
        view.addSubview(child.view)

        // Notify Child View Controller
        child.didMove(toParent: self)

        // Run closure
        completion?()
    }

    /**
     Remove children view controller in rootViewController

     - Parameters:
     - children: View controller will removed in rootViewController of coordinator
     - completion: completion run after remove children view controller
     */
    public func removeChild(_ child: UIViewController, completion: (() -> Swift.Void)? = nil) {
        guard child.parent != nil else {
            return
        }

        // Notify Child View Controller
        child.willMove(toParent: self)

        // Notify Child View Controller
        child.removeFromParent()

        // Remove Child View From Superview
        child.view.removeFromSuperview()

        // Run Closure
        completion?()
    }

    /// Add children view controller in rootViewController coordinator in specific view
    ///
    /// - Parameter childViewController: View controller will add in rootViewController of coordinator
    /// - Parameter completion: Run callback
    public func addInContainerScreen(childViewController child: UIViewController, in containterView: UIView, completion: (() -> Swift.Void)? = nil) {
        guard child.parent == nil else {
            return
        }

        addChild(child)
        containterView.addSubview(child.view)

        child.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            containterView.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
            containterView.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
            containterView.topAnchor.constraint(equalTo: child.view.topAnchor),
            containterView.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
        ]

        constraints.forEach { $0.isActive = true }
        containterView.addConstraints(constraints)

        child.didMove(toParent: self)

        completion?()
    }
}

/// TraitCollection Extensions
extension UIViewController {
    // MARK: - Variables

    public var isHorizontallyRegular: Bool {
        traitCollection.horizontalSizeClass == .regular
    }
}
#endif
