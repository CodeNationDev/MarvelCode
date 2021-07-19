//
import Foundation
import CryptoSwift
import SimplyLogger
import Alamofire
import SwiftMagicHelpers

class MarvelAPIManager {
    public static let shared = MarvelAPIManager()

    public func retrieveList(limit: Int? = nil, offset: Int? = nil, completion: @escaping ([Result]) -> Void ) {
        DispatchQueue.main.async {
//        guard let basePath = Bundle.main.infoDictionary?["BASEPATH"] as? String else { return }
//        guard let charactersPath = Bundle.main.infoDictionary?["CHARACTERSPATH"] as? String else { return }
        let ts = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
        let params:[String:AnyHashable] = {
            guard let publicKey = Bundle.main.infoDictionary?["PUBLIC_API_KEY"] as? String else { return [:] }
            guard let privateKey = Bundle.main.infoDictionary?["PRIVATE_API_KEY"] as? String else { return [:] }
            return [
                "ts" : ts,
                "apikey" : publicKey,
                "hash" : (ts + privateKey + publicKey).md5(),
                "limit": limit ?? 100,
                "offset": offset ?? 0]
        }()
        print(params)
            AF.request(Constants.Paths.base + Constants.Paths.characters, method: .get, parameters: params)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let data = response.data, let json = String(bytes: data, encoding: .utf8) {
                        do {
                            print(json)
                            let decoded = try SwiftMagicHelpers.HelperManager.JSON.jsonDecode(json, type: MarvelResponse.self)
                            if let data = decoded.data, let results = data.results {
                                completion(results)
                            }
                        } catch let error {
                            print(error)
                        }
                    }
                    print(response.result)
                case let .failure(error):
                    print("Request Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
