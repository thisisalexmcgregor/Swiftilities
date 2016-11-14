import Foundation

public extension FileManager {
    
    public var documentsDirectory: URL {
        guard let docsDir = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Could not locate Documents Directory.")
        }
        
        return docsDir
    }
    
    public var cachesDirectory: URL {
        guard let cachesDir = urls(for: .cachesDirectory, in: .userDomainMask).first else {
            fatalError("Could not locate Caches Directory.")
        }
        
        return cachesDir
    }
}
