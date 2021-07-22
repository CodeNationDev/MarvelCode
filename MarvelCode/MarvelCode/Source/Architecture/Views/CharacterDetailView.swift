//
import Foundation
import UIKit
import MarvelUIKitManager

class CharacterDetailView: BaseViewController {
    var characterData:Result?
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var story: UITextView!
    var comics: Comics?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(characterData ?? "NO CHARACTERS")
        showSpinner()
        avatar.load(url: characterData?.thumbnail?.path, size: .portait_uncanny, mime: (characterData?.thumbnail?.thumbnailExtension)!, completion: { [self] (result) in
            hideSpinner()
        })
        guard let characterData = characterData else { return }
        if let description = characterData.resultDescription {
            story.text = description.uppercased()
        }
        if let name = characterData.name {
            title = name.uppercased()
        }
        navigationColor = .spidermanBlue
        navigationTitleColor = .spidermanRed
    }
}

