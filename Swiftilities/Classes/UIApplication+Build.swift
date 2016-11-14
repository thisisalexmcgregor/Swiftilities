import UIKit

public extension UIApplication {
    
    static var versionString: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "--"
    }
    
    static var buildString: String {
        return Bundle.main.object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as? String ?? "--"
    }
}
