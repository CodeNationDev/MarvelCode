// MARK: - Stories
struct Stories: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI, name, type: String?
}
