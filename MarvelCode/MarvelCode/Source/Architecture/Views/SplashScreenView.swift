//
import UIKit

class SplashScreenView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Router.routeToMain()
    }
}
