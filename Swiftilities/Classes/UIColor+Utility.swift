import UIKit

public extension UIColor {
    
    typealias RGBAComponents = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    private var rgbaComponents: RGBAComponents? {
        var comps: RGBAComponents = (0,0,0,0)
        
        if getRed(&comps.red, green: &comps.green, blue: &comps.blue, alpha: &comps.alpha) {
            return comps
        }
        
        return .none
    }
    
    public convenience init?(hex: String, alpha: CGFloat = 1.0) {
        guard let hexInt = Int(hex) else { return nil }
        let components = (red: CGFloat((hexInt >> 16) & 0xff) / 255, green: CGFloat((hexInt >> 08) & 0xff) / 255, blue: CGFloat((hexInt >> 00) & 0xff) / 255)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha)
    }
    
    public convenience init(rgb: UInt32, alpha: CGFloat = 1.0) {
        let components = (red: CGFloat((rgb & 0xFF0000) >> 16) / 255, green: CGFloat((rgb & 0x00FF00) >> 16) / 255, blue: CGFloat((rgb & 0x0000FF) >> 16) / 255)
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: alpha)
    }
    
    public var hex: String? {
        if let components = rgbaComponents {
            let rgb = Int(Int((components.red * 255)) << 16) | Int(Int((components.green * 255)) << 8) | Int(Int((components.blue * 255)) << 0)
            return String(format: "#%06X", rgb)
        }
        
        return .none
    }
    
    public var rgb: UInt32? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            let rgb: UInt32 = (UInt32(a * 255.0) << 24) + (UInt32(r * 255.0) << 16) +  (UInt32(g * 255.0) << 8) + UInt32(b * 255.0)
            return rgb
        }
        
        return .none
    }
    
    public func modifying(alpha: CGFloat) -> UIColor? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }
        
        return .none
    }
    
    ///factor 0 - 1
    public func lighter(by factor: CGFloat) -> UIColor? {
        let f = min(max(factor, 0), 1)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: min(r + f, 1.0), green: min(g + f, 1.0), blue: min(b + f, 1.0), alpha: a)
        }
        
        return .none
    }
    
    /// factor 0 - 1
    public func darker(by factor: CGFloat) -> UIColor? {
        let f = min(max(factor, 0), 1)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: max(r - f, 0.0), green: max(g - f, 0.0), blue: max(b - f, 0.0), alpha: a)
        }
        
        return .none

    }
    
    
}
