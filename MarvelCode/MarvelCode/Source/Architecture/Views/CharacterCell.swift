//
import UIKit
import MarvelUIKitManager
import APIManager
import SimplyLogger

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 7)
        layer.shadowColor = UIColor.black.cgColor
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    func setupView() {
        characterName.size = 20.0
        mainView.backgroundColor = .backColor
        mainView.layer.borderWidth = 1.0
        mainView.layer.borderColor = UIColor.spidermanBlack.cgColor
        characterName.textColor = .cellTextColor
        avatar.layer.borderWidth = 2.5
        avatar.layer.borderColor = UIColor.spidermanBlack.cgColor
    }
}
