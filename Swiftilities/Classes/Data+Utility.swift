import Foundation

public extension Data {
    
    public var hex: String {
        return bytes.reduce("") { accum, current in
            return accum + String(format: "%02X", current)
        }
    }
    
    public var bytes: [UInt8] {
        var bytes = [UInt8](repeating: 0, count: count / MemoryLayout<UInt8>.size)
        copyBytes(to: &bytes, count: count)
        
        return bytes
    }
}
