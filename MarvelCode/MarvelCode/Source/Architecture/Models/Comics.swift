// MARK: - Comics
struct Comics: Codable {
    let available, returned: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI, name: String?
}
