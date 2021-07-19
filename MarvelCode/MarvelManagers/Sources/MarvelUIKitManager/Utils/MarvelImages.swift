//
import Foundation
import UIKit

/// ImageSizes
/// String implemented enumeration of all image format options.
public enum ImageSizes: String {
    case portait_small = "portrait_small" //50x75px
    case portait_medium = "portrait_medium"    //100x150px
    case portait_extraLarge = "portrait_xlarge"    //150x225px
    case portait_fantastic = "portrait_fantastic"    //168x252px
    case portait_uncanny = "portrait_uncanny"    //300x450px
    case portait_incredible = "portrait_incredible"    //216x324px
    case square_small = "standard_small"    //65x45px
    case square_medium = "standard_medium"    //100x100px
    case square_large = "standard_large"    //140x140px
    case square_xlarge = "standard_xlarge"    //200x200px
    case square_fantastic = "standard_fantastic"    //250x250px
    case square_amazing = "standard_amazing"    //180x180px
}
/// ImageURL
/// - Parameters:
///   - url:String = url path of image.
///   - size:ImageSize = enumeration of all formats.
///   - mime: image extension.
public typealias ImageURL = (url: String, size: ImageSizes, mime: String)

public extension UIImageView {
    func load(url: String?, placeholder: UIImage? = nil, size: ImageSizes, mime: String) {
        image = placeholder
        guard let resource = url else { return }
        guard let url = URL(string: "\(resource)/\(size.rawValue).\(mime)") else { return }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 20)
        
        // Check if cached image exists
        if let data = URLCache.shared.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
        }
        URLSession
            .shared
            .dataTask(with: request) { (data, response, _) in
                
                if let data = data, let response = response {
                    // Cache data
                    let cachedData = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedData, for: request)
                    // Show image
                    DispatchQueue.main.async {
                        if let image = UIImage(data: data) {
                            self.image = image
                        }
                    }
                }
            }
            .resume()
    }
    
    func loadReplacing(_ url: String?, size: ImageSizes, mime: String) {
        load(url: url, placeholder: image, size: size, mime: mime)
    }
}

