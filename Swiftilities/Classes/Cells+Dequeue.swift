import UIKit

//MARK: Reusable
public protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension UIView: Reusable {
    public static var reuseIdentifier: String { return String(describing: self) }
}

//MARK: NibLoadable
public protocol NibLoadable {
    static var nibName: String { get }
}

extension UIView: NibLoadable {
    public static var nibName: String { return String(describing: self) }
}

//MARK: UITableView
public extension UITableView {
    
    //MARK: Registration
    func register<T: UITableViewCell>(_ type: T.Type) where T: Reusable {
        register(type, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UITableViewCell>(for type: T.Type) where T: Reusable, T: NibLoadable {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: type)), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ type: T.Type) where T: Reusable {
        register(type, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UITableViewHeaderFooterView>(forHeaderFooterView type: T.Type) where T: Reusable, T: NibLoadable {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: type)), forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    //MARK: Dequeue
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let reusableCell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue a reusable cell of type \(T.self) with identifier \(T.reuseIdentifier) for use in \(self)")
        }
        
        return reusableCell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard let reusableView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue a reusable view of type \(T.self) with identifier \(T.reuseIdentifier) for use in \(self)")
        }
        
        return reusableView
    }
}

//MARK: UICollectionView
public extension UICollectionView {
    
    //MARK: Supplementary Element Kind
    public enum SupplementaryElementKind {
        case sectionHeader
        case sectionFooter
        
        var type: String {
            switch self {
            case .sectionHeader: return UICollectionElementKindSectionHeader
            case .sectionFooter: return UICollectionElementKindSectionFooter
            }
        }
    }
    
    //MARK: Registration
    func register<T: UICollectionViewCell>(_ type: T.Type) where T: Reusable {
        register(type, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UICollectionViewCell>(for type: T.Type) where T: Reusable, T: NibLoadable {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: type)), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderFooter<T: UICollectionReusableView>(_ type: T.Type) where T: Reusable {
        registerHeaderFooter(type, forSupplementaryViewOfKind: .sectionHeader)
        registerHeaderFooter(type, forSupplementaryViewOfKind: .sectionFooter)
    }
    
    func registerHeaderFooter<T: UICollectionReusableView>(_ type: T.Type, forSupplementaryViewOfKind kind: SupplementaryElementKind) where T: Reusable {
        register(type, forSupplementaryViewOfKind: kind.type, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UICollectionReusableView>(forHeaderFooterView type: T.Type) where T: Reusable, T: NibLoadable {
        registerNib(forHeaderFooterView: type, forSupplementaryViewOfKind: .sectionHeader)
        registerNib(forHeaderFooterView: type, forSupplementaryViewOfKind: .sectionFooter)
    }
    
    func registerNib<T: UICollectionReusableView>(forHeaderFooterView type: T.Type, forSupplementaryViewOfKind kind: SupplementaryElementKind) where T: Reusable, T: NibLoadable {
        register(UINib(nibName: T.nibName, bundle: Bundle(for: type)), forSupplementaryViewOfKind: kind.type, withReuseIdentifier: T.reuseIdentifier)
    }
    
    //MARK: Dequeue
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let reusableCell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError()
        }
        
        return reusableCell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(of kind: SupplementaryElementKind, for indexPath: IndexPath) -> T where T: Reusable {
        guard let reusableView = dequeueReusableSupplementaryView(ofKind: kind.type, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError()
        }
        
        return reusableView
    }
}
