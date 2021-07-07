//
import UIKit
import ReachabilityManager
import CryptoManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ReachabilityManagerImp.sharedInstance.start()
        print(CryptoManager.md5Hex(string: "Hola"))
        return true
    }
}

