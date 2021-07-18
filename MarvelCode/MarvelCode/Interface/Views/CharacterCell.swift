//
import UIKit
import MarvelUIKitManager

class CharacterCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var characterName: MarvelLabel!
    
    public var avatarImage: UIImageView?
    public var name: String?
    public var viewColor: UIColor? {
        didSet {
            mainView.backgroundColor = viewColor
        }
    }
    public var imageUrl: (url: String, size: ImageSizes, mime: String )? {
        didSet {
            if let imageUrl = imageUrl {
                avatar.load(url: imageUrl.url, size: imageUrl.size, mime: imageUrl.mime)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
   public func configureCell() {
        if let name = name {
            self.characterName.text = name
        }
        
        if let avatarImage = avatarImage {
            self.avatar = avatarImage
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView() {
        characterName.size = 20.0
    }

}
