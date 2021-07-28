//
import Foundation
import CryptoSwift
import SimplyLogger
import Alamofire
import SwiftMagicHelpers
import Constants
import ReachabilityManager

public let sharedMarvelAPIManager = MarvelAPIManager()

public class MarvelAPIManager {
    
    public func retrieveCharacters(params: MarvelAPIParams , heroID: Int? = nil, completion: @escaping ([Result]) -> Void) {
        DispatchQueue.main.async { [self] in
            if sharedReachabilityManager.isReachable() {
                SimplyLogger.log(str: Constants.Messages.Info.reachabilitySuccess, identity: "reachability", category: .success)
                request(params: params, path: Constants.Paths.characters + "\(heroID == nil ? "":"/\(String(heroID!))" )") { (success, results) in
                    if success {
                        completion(results)
                    }
                }
            } else {
                SimplyLogger.log(str: Constants.Messages.Errors.reachabilityFail, identity: "reachability", category: .error)
            }
        }
    }
    
    fileprivate func request(params: MarvelAPIParams, path: String, completion: @escaping (Bool,[Result]) -> Void) {
        AF.request(Constants.Paths.base + path, method: .get, parameters: params.asDictionary())
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let data = response.data, let json = String(bytes: data, encoding: .utf8) {
                        do {
                            print(json)
                            let decoded = try SwiftMagicHelpers.HelperManager.JSON.jsonDecode(json, type: MarvelResponse.self)
                            if let data = decoded.data, let results = data.results {
                                SimplyLogger.log(str: Constants.Messages.Info.requestSuccess, category: .success)
                                completion(true,results)
                            }
                            
                        } catch let error {
                            SimplyLogger.log(str: "\(Constants.Messages.Errors.errorParser), reason: \(error.localizedDescription)", category: .error)
                        }
                    }
                case let .failure(error):
                    SimplyLogger.log(str: "\(Constants.Messages.Errors.errorRequest), reason: \(error.localizedDescription)", category: .error)
                }
            }
        
    }
}

