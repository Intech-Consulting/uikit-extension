#if canImport(UIKit)
import UIKit

open class NiblessViewController: UIViewController {
    // MARK: - Methods

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable,
               message: "Loading this view controller from nib is unsupported in favor of initializer dependency injection")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable,
               message: "Loading this view controller from nib is unsupported in favor of initializer dependency injection")
    public required init?(coder _: NSCoder) {
        fatalError("Loading this view controller from nib is unsupported in favor of initializer dependency injection")
    }

    deinit {
        print("deinit => \(self)")
    }
}
#endif
