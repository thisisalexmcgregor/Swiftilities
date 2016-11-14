import Foundation

public extension Int {
    
    public var random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

