//
import Foundation
import UIKit

extension UIApplication {
    
    /// Function for catch the top view controller in Viewcycle stack.
    /// - Parameter base: first member of stack requested for get top ViewController.
    /// - Returns: top UIViewController object finded. Could be UINavigationController, UITabBarController or a simple ViewController.
    public static func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}


