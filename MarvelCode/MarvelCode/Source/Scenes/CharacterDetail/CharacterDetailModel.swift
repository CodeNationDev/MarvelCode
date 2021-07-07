//
import Foundation

import UIKit

struct Character: Codable {
  
  var id: Int?
  var name: String?
  var description: String?
  var resourceURI: String?
  var urls: [Url]?
  var thumbnail: Image?
  var comics: ComicList?
  var stories: StoryList?
  var events: EventList?
  var series: SeriesList?
}

struct ComicList: Codable {
  var available: Int?
  var returned: Int?
  var collectionURI: String?
  var items: [ComicSummary]?
}

struct ComicSummary: Codable {
  var resourceURI: String?
  var name: String?
}

struct EventList: Codable {
  var available: Int?
  var returned: Int?
  var collectionURI: String?
  var items: [EventSummary]?
}

struct EventSummary: Codable {

  var resourceURI: String?
  var name: String?
}

struct Image: Codable {

  var path: String?
  var ext: String?

  var url: String {
    guard let path = path, let ext = ext else { return "" }
    return "\(path).\(ext)"
  }

  enum CodingKeys: String, CodingKey {
    case path
    case ext = "extension"
  }
}

struct SeriesList: Codable {
  var available: Int?
  var returned: Int?
  var collectionURI: String?
  var items: [SeriesSummary]?
}

struct SeriesSummary: Codable {
  var resourceURI: String?
  var name: String?
}

struct StoryList: Codable {
  var available: Int?
  var returned: Int?
  var collectionURI: String?
  var items: [StorySummary]?
}

struct StorySummary: Codable {
  var resourceURI: String?
  var name: String?
  var type: String?
}

struct Url: Codable {
  var type: String?
  var url: String?
}


