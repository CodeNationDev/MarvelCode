//
import Foundation

class MainViewModel {
    
    func loadData(completion: @escaping ([Result]) -> Void) {
        MarvelAPIManager.shared.retrieveList { results in
            completion(results)
        }
    }
}
