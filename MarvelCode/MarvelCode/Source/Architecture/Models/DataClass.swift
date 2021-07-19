// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int?
    let results: [Result]?
}
