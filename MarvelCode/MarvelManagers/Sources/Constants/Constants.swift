//
import Foundation

public struct Constants {
    public struct APIinfo {
        public static let publicKey = "09fca74c52fe76c064aee0119df51842"
        public static let privateKey = "c4f3d214a9c2592776b898f64ab41eb52fa9276e"
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
