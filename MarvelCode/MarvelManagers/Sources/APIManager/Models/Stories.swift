// MARK: - Stories
public struct Stories: Codable {
    public let available, returned: Int?
    public let collectionURI: String?
    public let items: [StoriesItem]?
}

// MARK: - StoriesItem
public struct StoriesItem: Codable {
    public let resourceURI, name, type: String?
}
