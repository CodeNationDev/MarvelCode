//
import Foundation
import UIKit


/// Custom segue.
public class ReplaceSegue: UIStoryboardSegue {
    
    /// Main function of custom segue that manage the rootWindow member, transition effect and animation.
   public override func perform() {
        if let shredDelegate = UIApplication.shared.delegate, let rWindow = shredDelegate.window, let inWindow = rWindow {
            UIView.transition(with: inWindow, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                if let delegate = UIApplication.shared.delegate as? AppDelegate, let rootwindow = delegate.window {
                    rootwindow.rootViewController = self.destination
                }
            }, completion: nil)
        }
    }
}
