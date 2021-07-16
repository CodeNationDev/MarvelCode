//
import Foundation


struct Constants {
    struct AppInfo {
        static let name = "MarvelCode"
    }
    struct Paths {
        static let base = "https://gateway.marvel.com"
        static let characters = "/v1/public/characters"
    }
    struct Errors {
        static let retrievePublicKey = "Error getting public key"
        static let retrievePrivateKey = "Error getting private key"
    }
    struct Segues {
        static let splashToMain = "splashToMain"
    }
    struct Views {
        struct TableViewCells {
            static let characterCell = "CharacterCell"
        }
    }
}
