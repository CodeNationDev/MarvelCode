//
import Foundation

public extension String {
    
    /// variable for get lcalization strings.
     var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

