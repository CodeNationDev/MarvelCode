//
import Foundation
import UIKit
import Helpers
import APIManager
import Constants


/// Router for manage viewcycle flow
class Router: NSObject {
    
    
    /// Function for segues to main from any location
    class func routeToMain() {
        guard let controller = UIApplication.getTopViewController() else { return }
        controller.performSegue(withIdentifier: Constants.Segues.splashToMain, sender: nil)
    }
    
    
    /// Function for navigate to character detail view from any location.
    /// - Parameter characterData: character data info object.
    class func routeToCharacterDetail(characterData: Result ) {
        guard let controller = UIApplication.getTopViewController() else { return }
        if let initial = UIStoryboard(name: Constants.StoryBoards.characterDetail, bundle: .main).instantiateInitialViewController() {
            guard let navController = initial as? UINavigationController else { return }
            guard let characterDetailViewController = navController.viewControllers.first as? CharacterDetailView else { return }
            characterDetailViewController.heroID = characterData.id
            controller.navigationController?.pushViewController(characterDetailViewController, animated: true)
            
        }
    }
}
