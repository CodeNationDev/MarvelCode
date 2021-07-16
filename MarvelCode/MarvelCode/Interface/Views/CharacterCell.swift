//
import UIKit
import MarvelUIKitManager

class CharacterCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var characterName: MarvelLabel!
    
    public var avatarImage: UIImage?
    public var name: String?
    public var viewColor: UIColor? {
        didSet {
            mainView.backgroundColor = viewColor
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
            self.avatar.image = avatarImage
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView() {
        characterName.size = 20.0
    }

}
