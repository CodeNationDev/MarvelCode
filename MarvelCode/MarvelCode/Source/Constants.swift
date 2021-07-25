//
import Foundation

struct Constants {
    struct AppInfo {
        static let name = "MarvelCode"
    }
    struct APIinfo {
        static let publicKey = Bundle.main.infoDictionary?["PUBLIC_API_KEY"] as? String ?? ""
        static let privateKey = Bundle.main.infoDictionary?["PRIVATE_API_KEY"] as? String ?? ""
        static let ts = UUID().uuidString.replacingOccurrences(of: "-", with: "").lowercased()
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
        struct ViewControllers {
            static let main = "Character List"
            static let characterDetail = "Character Detail"
        }
    }
    struct StoryBoards {
        static let characterDetail = "CharacterDetail"
    }
    
}
