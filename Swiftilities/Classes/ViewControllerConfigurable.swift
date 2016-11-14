import UIKit

public protocol Configurable {
    associatedtype ConfiguredType
    
    func configure(with element: ConfiguredType) 
}

