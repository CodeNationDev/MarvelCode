//
import Foundation
import UIKit

class CharacterDetailView: BaseViewController {
    var characterData:Result?
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var story: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(characterData ?? "NO CHARACTERS")
        avatar.load(url: characterData?.thumbnail?.path, size: .portait_extraLarge, mime: (characterData?.thumbnail?.thumbnailExtension)!)
        if let characterData = characterData, let description = characterData.resultDescription {
            story.text = description.uppercased()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let characterData = characterData, let name = characterData.name {
            title = name.uppercased()
        }
        navigationColor = .spidermanBlue
        navigationTitleColor = .spidermanRed
    }
}
