import UIKit

//MARK: Storyboard Identifiable
public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension UIViewController: StoryboardIdentifiable {
    public static var storyboardIdentifier: String { return String(describing: self) }
}

public extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let vc = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Unable to instantiate a view controller with identifier \(T.storyboardIdentifier) from storyboard \(self)")
        }
        
        return vc
    }
}

