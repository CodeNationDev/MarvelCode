//
import Foundation
import UIKit

class MainView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let publicAPIkey = Bundle.main.infoDictionary?["PUBLIC_API_KEY"] as? String else { return }
        guard let privateAPIkey = Bundle.main.infoDictionary?["PRIVATE_API_KEY"] as? String else { return }
        print("Public API Key: \(publicAPIkey)")
        print("Private API Key: \(privateAPIkey)")
    }
}
