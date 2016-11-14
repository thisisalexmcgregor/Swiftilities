import UIKit

public extension UIApplication {
    
    public static var versionString: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "--"
    }
    
    public static var buildString: String {
        return Bundle.main.object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as? String ?? "--"
    }
}
