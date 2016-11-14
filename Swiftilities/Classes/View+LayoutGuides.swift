import UIKit

public extension UIView {
    
    public func showLayoutGuides(recursively: Bool) {
        
        //Recursively show layout guides if necessary
        if recursively {
            subviews.forEach { $0.showLayoutGuides(recursively: recursively) }
        }
        
        //Remove any previously drawn LayoutGuideOverlayLayers
        layer.sublayers?.filter { $0 is LayoutGuideOverlayLayer }.forEach { $0.removeFromSuperlayer() }
        
        //Create overlays for all layout guides
        layoutGuides.forEach {
            let guideLayer = LayoutGuideOverlayLayer(guide: $0, color: .red)
            layer.addSublayer(guideLayer)
        }
    }
}

class LayoutGuideOverlayLayer: CAShapeLayer {
    
    private let lineDashPhaseKey = "lineDashPhase"
    
    init(guide: UILayoutGuide, color: UIColor) {
        super.init()
        
        path = UIBezierPath(rect: guide.layoutFrame).cgPath
        strokeColor = color.cgColor
        lineWidth = 1.0
        lineDashPattern = [2, 2]
        fillColor = UIColor.clear.cgColor
        
        //Constantly animate the dashed line - easily differentiate between guides
        let dashAnimation = CABasicAnimation(keyPath: lineDashPhaseKey)
        dashAnimation.duration = 0.75
        dashAnimation.repeatCount = Float.infinity
        dashAnimation.fromValue = 0
        dashAnimation.toValue = 3
        self.add(dashAnimation, forKey: lineDashPhaseKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
