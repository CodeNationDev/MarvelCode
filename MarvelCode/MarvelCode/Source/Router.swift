//
import Foundation
import UIKit
import Helpers

class Router: NSObject {
    
   class func routeToMain() {
        DispatchQueue.main.async {
            guard let controller = UIApplication.getTopViewController() else { return }
            controller.performSegue(withIdentifier: Constants.Segues.splashToMain.rawValue, sender: nil)
        }
    }
}
