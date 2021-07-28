// MARK: - DataClass
public struct DataClass: Codable {
    public let offset, limit, total, count: Int?
    public let results: [Result]?
}
