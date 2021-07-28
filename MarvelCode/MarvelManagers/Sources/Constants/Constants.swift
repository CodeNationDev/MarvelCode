//
import UIKit

public struct Constants {
    public struct APIinfo {
        public static let publicKey = Bundle.main.infoDictionary?["PUBLIC_API_KEY"] as? String ?? ""
        public static let privateKey = Bundle.main.infoDictionary?["PRIVATE_API_KEY"] as? String ?? ""
        public static let ts = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
    }
    public struct Paths {
        public static let base = "https://gateway.marvel.com"
        public static let characters = "/v1/public/characters"
    }
    public struct Messages {
        public struct Errors {
            public static let errorRequest = "Error retriving character/s"
            public static let errorParser = "Error parsing response data"
            public static let retrievePublicKey = "Error getting public key"
            public static let retrievePrivateKey = "Error getting private key"
            public static let reachabilityFail = "No internet connection"
        }
        public struct Info {
            public static let requestSuccess = "Request success"
            public static let reachabilitySuccess = "Internet connection is OK"
        }
    }
}
