// MARK: - ApiParams

struct MarvelAPIParams {
    var ts: String?
    var apikey: String?
    var hash: String?
    var limit: Int?
    var offset: Int?
    
    public init(limit: Int? = nil, offset: Int? = nil) {
        self.ts = Constants.APIinfo.ts
        self.apikey = Constants.APIinfo.publicKey
        self.hash = (Constants.APIinfo.ts + Constants.APIinfo.privateKey + Constants.APIinfo.publicKey).md5()
        self.limit = limit ?? 100
        self.offset = offset ?? 0
    }
    func asDictionary() -> [String: Any] {
        var dict:[String: Any] = [:]
        dict["ts"] = self.ts
        dict["apikey"] = self.apikey
        dict["hash"] = self.hash
        if let limit = self.limit { dict["limit"] = limit }
        if let offset = self.offset { dict["offset"] = offset }
        
        return dict
    }
}
