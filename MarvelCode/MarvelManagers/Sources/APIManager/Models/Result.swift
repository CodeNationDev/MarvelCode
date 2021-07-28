// MARK: - Result
public struct Result: Codable {
    public let id: Int?
    public let name, resultDescription, modified: String?
    public let resourceURI: String?
    public let urls: [URLElement]?
    public let thumbnail: Thumbnail?
    public let comics: Comics?
    public let stories: Stories?
    public let events, series: Comics?

    public enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, resourceURI, urls, thumbnail, comics, stories, events, series
    }
}
