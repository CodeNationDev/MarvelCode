import Foundation
import CommonCrypto

public class CryptoManager: NSObject {
   public class func md5Data(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_SHA256(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    
    public class func md5Hex(string: String, format: String = "%02hhx" ) -> String {
        md5Data(string: string).map { String(format: format , $0) }.joined()
    }
    
    public class func md5Base64(string: String) -> String {
        md5Data(string: string).base64EncodedString()
    }
}
