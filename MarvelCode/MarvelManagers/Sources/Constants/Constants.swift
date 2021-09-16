//
import Foundation

public struct Constants {
    public struct APIinfo {
        /// Add your own public key in Schemes -> Edit Scheme -> Environment Variables -> PRIVATE_KEY.
        public static let publicKey = ProcessInfo.processInfo.environment["PUBLIC_KEY"] ?? ""
        
        /// Add your own public key in Schemes -> Edit Scheme -> Environment Variables -> PRIVATE_KEY.
        public static let privateKey = ProcessInfo.processInfo.environment["PRIVATE_KEY"] ?? ""
        public static let ts = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
    }
    public struct Paths {
        public static let base = "https://gateway.marvel.com"
        public static let characters = "/v1/public/characters"
    }
    public struct Messages {
        public struct Errors {
            public static let errorGenericTitle = "Error"
            public static let errorRequest = "Error retriving character/s"
            public static let errorParser = "Error parsing response data"
            public static let errorEnvironmentVariablesKey = "Cannot retrieve public or private keys from environment variables and app will close. Please, add your own API keys in the environment variables of app scheme for use Marvel services."
            public static let errorRetrievingResults = "Something went wrong while retrieving results from service or service is down and app will close. Please, also check your api keys configuration and try again."
            public static let retrievePublicKey = "Error getting public key"
            public static let retrievePrivateKey = "Error getting private key"
            public static let reachabilityFail = "No internet connection"
        }
        public struct Info {
            public static let requestSuccess = "Request success"
            public static let reachabilitySuccess = "Internet connection is OK"
        }
        public struct Warning {
            public static let adviceGenericTitle = "Advice"
        }
        public struct Actions {
            public static let ok = "OK"
            public static let accept = "Accept"
            public static let cancel = "Cancel"
            public static let yes = "Yes"
            public static let no = "No"
        }
        
    }
}
