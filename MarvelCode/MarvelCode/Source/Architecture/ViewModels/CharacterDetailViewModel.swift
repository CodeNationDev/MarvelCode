
import Foundation
import APIManager


class CharacterDetailViewModel {
    var results = [Result]()
    
    func loadData(heroID: Int, completion: @escaping (Bool) -> Void) {
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(), heroID: heroID) { (results) in
            self.results = results
            completion(true)
        }
    }
}
