
import Foundation
import APIManager


/// ViewModel of CharacterDetail Scene.
class CharacterDetailViewModel {
    /// Var with data result
    var hero:Result?
    
    /// Requests data to API Manager.
    /// - Parameters:
    ///   - limit: limit of results.
    ///   - offset: excluded results.
    ///   - completion: result of data back.
    func loadData(heroID: Int, completion: @escaping (Bool) -> Void) {
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(), heroID: heroID) { (results) in
            if let hero = results.first {
                self.hero = hero
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
