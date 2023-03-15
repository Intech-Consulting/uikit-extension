#if canImport(UIKit)
import UIKit

extension UIDevice {
    // swiftlint:disable identifier_name
    public enum ScreenType: String {
        case iPhoneSE
        case iPhone6_7_8
        case iPhone6_7_8Plus
        case iPhoneX
        case Unknown
    }

    // swiftlint:enable identifier_name
    public var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return .iPhoneSE
        case 1334:
            return .iPhone6_7_8
        case 2208, 1920:
            return .iPhone6_7_8Plus
        case 2436:
            return .iPhoneX
        default:
            return .Unknown
        }
    }
}
#endif
