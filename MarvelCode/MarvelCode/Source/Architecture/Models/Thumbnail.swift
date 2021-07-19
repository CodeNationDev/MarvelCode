// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path, thumbnailExtension: String?
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}