//
import Foundation
import UIKit
import MarvelUIKitManager
import Helpers

class CharacterDetailView: BaseViewController {
    let viewmodel = CharacterDetailViewModel()
    var characterData:Result?
    var heroID:Int?
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var story: UITextView!
    var comics: Comics?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styler()
        guard let heroID = heroID else { return }
        showSpinner()
        viewmodel.loadData(heroID: heroID) { [self] (ready) in
            if ready {
                if let characterData = viewmodel.results.first {
                    var comics:[String] = []
                    characterData.comics?.items?.forEach { comics.append($0.name?.uppercased() ?? "") }
                    story.text = String(format: "character.detail.story".localized, characterData.resultDescription?.uppercased() ?? "", "\(characterData.comics?.available ?? 0)", comics.joined(separator: ", "))
//                    if let description = characterData.resultDescription, !description.isEmpty {
//                        story.text = description.uppercased()
//                    } else {story.text = "NO DESCRIPTION AVAILABLE" }
                    if let name = characterData.name {
                        title = name.uppercased()
                    }
                    if let thumbnail = characterData.thumbnail, let mime = thumbnail.thumbnailExtension, let path = thumbnail.path {
                        avatar.load(url: path, size: .portait_uncanny, mime: mime, completion: { [self] (result) in
                            hideSpinner()
                        })
                    }
                    
                }
            }
        }
        print(characterData ?? "NO CHARACTERS")
    }
    
    fileprivate func styler() {
        navigationColor = .spidermanBlue
        navigationTitleColor = .spidermanRed
        view.backgroundColor = .spidermanBlue
    }
}

