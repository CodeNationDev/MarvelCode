// MARK: - Welcome
public struct MarvelResponse: Codable {
    public let code: Int?
    public let status, copyright, attributionText: String?
    public let attributionHTML: String?
    public let data: DataClass?
    public let etag: String?
}
