import Foundation

public extension Array {
    
    var random: Element {
        return self[count.random]
    }
}
