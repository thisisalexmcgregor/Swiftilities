import UIKit

public extension Float {
    
    var radians: Float {
        return self * Float.pi / 180.0
    }
    
    var degrees: Float {
        return self * 180.0 / Float.pi
    }
}

public extension CGFloat {
    
    static var pi: CGFloat {
        return CGFloat(Float.pi)
    }
    
    var radians: CGFloat {
        return self * CGFloat.pi / 180.0
    }
    
    var degrees: CGFloat {
        return self * 180.0 / CGFloat.pi
    }
}
