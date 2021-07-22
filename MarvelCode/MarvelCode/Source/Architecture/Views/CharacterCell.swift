//
import UIKit
import MarvelUIKitManager

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var characterName: MarvelLabel!

    public var viewColor: UIColor? {
        didSet {
            mainView.backgroundColor = viewColor
        }
    }
    public var imageUrl: ImageURL? {
        didSet {
            if let imageUrl = imageUrl {
                avatar.load(url: imageUrl.url, size: imageUrl.size, mime: imageUrl.mime, completion: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    public func configureCell(data: Result) {
        guard let name = data.name else { return }
        let imageUrl = data.thumbnail?.path ?? ""
        let mime_extension = data.thumbnail?.thumbnailExtension ?? ""
        characterName.text = name.uppercased()
        avatar.load(url: imageUrl, size: .square_medium, mime: mime_extension, completion: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView() {
        characterName.size = 20.0
    }
    
}
