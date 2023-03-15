#if canImport(UIKit)
import UIKit

open class NiblessView: UIView {
    // MARK: - Methods

    public init() {
        super.init(frame: .zero)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable,
               message: "Loading this view controller from nib is unsupported in favor of initializer dependency injection")
    public required init?(coder _: NSCoder) {
        fatalError("Loading this view controller from nib is unsupported in favor of initializer dependency injection")
    }
}
#endif
