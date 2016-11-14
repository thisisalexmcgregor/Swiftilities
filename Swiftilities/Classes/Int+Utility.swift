import Foundation

public extension Int {
    
    var random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

