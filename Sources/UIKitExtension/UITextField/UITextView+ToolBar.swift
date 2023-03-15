#if canImport(UIKit)
import UIKit

extension UITextView {
    public func setToolBar(target: Any) {
        let screenWidth = UIScreen.main.bounds.width

        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: target, action: #selector(tapCancel))
        toolBar.setItems([cancel, flexible], animated: false)
        inputAccessoryView = toolBar
    }

    @objc
    func tapCancel() {
        resignFirstResponder()
    }
}
#endif
