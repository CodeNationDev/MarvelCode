//
import Foundation

class MainViewModel {
    
    func loadData(limit: Int? = nil, offset: Int? = nil, completion: @escaping ([Result]) -> Void) {
        MarvelAPIManager.shared.retrieveList(limit: limit, offset: offset) { results in
            completion(results)
        }
    }
}
