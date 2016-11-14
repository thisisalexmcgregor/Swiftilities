import UIKit

public extension Float {
    
    public var radians: Float {
        return self * Float.pi / 180.0
    }
    
    public var degrees: Float {
        return self * 180.0 / Float.pi
    }
}

public extension CGFloat {
    
    public static var pi: CGFloat {
        return CGFloat(Float.pi)
    }
    
    public var radians: CGFloat {
        return self * CGFloat.pi / 180.0
    }
    
    public var degrees: CGFloat {
        return self * 180.0 / CGFloat.pi
    }
}
