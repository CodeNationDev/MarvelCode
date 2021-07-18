//
import Foundation
import UIKit
import Helpers

class Router: NSObject {
    
    class func routeToMain() {
        guard let controller = UIApplication.getTopViewController() else { return }
        controller.performSegue(withIdentifier: Constants.Segues.splashToMain, sender: nil)
    }
    
    class func routeToCharacterDetail(characterData: Result ) {
        guard let controller = UIApplication.getTopViewController() else { return }
        if let initial = UIStoryboard(name: Constants.StoryBoards.characterDetail, bundle: .main).instantiateInitialViewController() {
            guard let navController = initial as? UINavigationController else { return }
            guard let characterDetailViewController = navController.viewControllers.first as? CharacterDetailView else { return }
            characterDetailViewController.characterData = characterData
            controller.navigationController?.pushViewController(characterDetailViewController, animated: true)
            
        }
    }
}
