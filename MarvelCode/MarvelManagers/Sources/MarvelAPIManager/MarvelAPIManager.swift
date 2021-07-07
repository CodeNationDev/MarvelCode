//
import Foundation
import CryptoManager

public class MarvelAPIManager {
    guard static let publicAPIkey = Bundle.main.infoDictionary?["PUBLIC_API_KEY"] as? String else { return }
    guard static let privateAPIkey = Bundle.main.infoDictionary?["PRIVATE_API_KEY"] as? String else { return }
    static let ts = String(Date().timeIntervalSince1970)
    var params = [
          "ts" : ts,
          "hash" : CryptoManager.md5Hex(string: ts + privateAPIkey + publicAPIkey).lowercased()
          "apikey" : publicAPIkey ,
          "limit" : String(Constants.limit),
          "offset" : String(page * Constants.limit)
        ]
}
