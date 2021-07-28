// MARK: - Comics
public struct Comics: Codable {
    public let available, returned: Int?
    public let collectionURI: String?
    public let items: [ComicsItem]?
}

// MARK: - ComicsItem
public struct ComicsItem: Codable {
    public let resourceURI, name: String?
}
