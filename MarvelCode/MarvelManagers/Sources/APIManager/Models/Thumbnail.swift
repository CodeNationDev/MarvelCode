// MARK: - Thumbnail
import UIKit

public struct Thumbnail: Codable {
    public let path, thumbnailExtension: String?
    public enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
