//
import Foundation

class MainViewModel {
    var results = [Result]()
    
    func loadData(limit: Int? = nil, offset: Int? = nil, completion: @escaping (Bool) -> Void) {
        MarvelAPIManager.shared.retrieveList(limit: limit, offset: offset) { results in
            self.results += results
            completion(true)
        }
    }
}
