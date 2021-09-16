//
import Foundation
import APIManager


/// ViewModel of Main scene.
class MainViewModel {
    /// Var with data result
    var results = [Result]()
    
    /// Requests data to API Manager.
    /// - Parameters:
    ///   - limit: limit of results.
    ///   - offset: excluded results.
    ///   - completion: result of data back.
    func loadData(limit: Int? = nil, offset: Int? = nil, completion: @escaping (Bool) -> Void) {
        sharedMarvelAPIManager.retrieveCharacters(params: MarvelAPIParams(limit: limit, offset: offset)) { (results) in
            if !results.isEmpty {
                self.results += results
                completion(true)
            } else  { completion(false) }
        }
    }
}
