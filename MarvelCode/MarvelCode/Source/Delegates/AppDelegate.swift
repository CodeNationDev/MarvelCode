//
import UIKit
import ReachabilityManager
import IntegirtySwift
import SimplyLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ReachabilityManagerImp.sharedInstance.start()
        if !IntegrityManager.isSecure {
            SimplyLogger.log(str: "Your device is not secure!!", appName: "MarvelPackage", identity: "TESTING", category: .error, type: .debug, log: .default)
        }
        return true
    }
}

