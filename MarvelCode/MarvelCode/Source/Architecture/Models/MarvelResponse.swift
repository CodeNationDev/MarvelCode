// MARK: - Welcome
struct MarvelResponse: Codable {
    let code: Int?
    let status, copyright, attributionText: String?
    let attributionHTML: String?
    let data: DataClass?
    let etag: String?
}
