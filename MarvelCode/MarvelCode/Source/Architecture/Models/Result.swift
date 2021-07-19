// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name, resultDescription, modified: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    let events, series: Comics?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, resourceURI, urls, thumbnail, comics, stories, events, series
    }
}
