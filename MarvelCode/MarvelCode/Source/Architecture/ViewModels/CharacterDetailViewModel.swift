
import Foundation
import APIManager


class CharacterDetailViewModel {
    var hero:Result?
    
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
