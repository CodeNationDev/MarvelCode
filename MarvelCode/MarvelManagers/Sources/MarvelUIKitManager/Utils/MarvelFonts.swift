//
import Foundation
import UIKit
import SimplyLogger

extension UIFont {
    
    /// Function for create and register the custom font.
    /// - Parameter size: size of font
    /// - Returns: UIFont object.
    public class func marvelRegular(size: CGFloat) -> UIFont {
       let fontName: String = "Marvel-Regular"
        registerFont(withFilenameString: "\(fontName).ttf", bundle: Bundle.module)
        if let font = UIFont(name: fontName, size: size) {
            SimplyLogger.log(str: "Successfull creating font \(font.fontName)", category: .success)
            return font
        } else {
            SimplyLogger.log(str: "Error creating font", category: .error)
        }
        return .systemFont(ofSize: size)
   }
}

internal extension UIFont {
    
    /// Function for reguster fonts programmatically.
    /// - Parameters:
    ///   - filenameString: the PostScript name of custom font.
    ///   - bundle: the bundle context where font is.
    static func registerFont(withFilenameString filenameString: String, bundle: Bundle) {
        
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            SimplyLogger.log(str: "UIFont+:  Failed to register font - path for resource not found.", category: .error)
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            SimplyLogger.log(str: "UIFont+:  Failed to register font - font data could not be loaded.", category: .error)
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            SimplyLogger.log(str: "UIFont+:  Failed to register font - data provider could not be loaded.", category: .error)
            return
        }

        guard let font = CGFont(dataProvider) else {
            SimplyLogger.log(str: "UIFont+:  Failed to register font - font could not be loaded.", category: .error)
            return
        }

        var errorRef: Unmanaged<CFError>?
        if CTFontManagerRegisterGraphicsFont(font, &errorRef) == false {
            SimplyLogger.log(str: "UIFont+: this font is already registered in the main bundle.", category: .warning)
        }
    }
}

