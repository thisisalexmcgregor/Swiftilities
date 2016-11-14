import Foundation

public extension String {
    
    public var count: Int {
        return characters.count
    }
    
    //MARK: Subscripting
    public subscript (i: Int) -> Character? {
        get {
            return index(startIndex, offsetBy: i, limitedBy: endIndex).map { self[$0] } ?? .none
        }
    }
    
    public subscript(range: Range<Int>) -> String? {
        get {
            let targetStartIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex)
            let targetEndIndex = index(startIndex, offsetBy: range.upperBound, limitedBy: endIndex)
            
            if let tStart = targetStartIndex, let tEnd = targetEndIndex {
                return self[Range(uncheckedBounds: (tStart, tEnd))]
            }
            
            return .none
        }
    }
    
    //MARK: Localization
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    public func localized(withComment comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }

}
