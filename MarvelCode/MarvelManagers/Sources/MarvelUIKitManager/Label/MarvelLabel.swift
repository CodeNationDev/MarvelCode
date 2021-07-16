//
import Foundation
import UIKit

public class MarvelLabel: UILabel {
    public var size: CGFloat {
        get {
            return font.pointSize
        }
        set {
            font = .marvelRegular(size: newValue)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        textColor = .marvelBlack1
        font = .marvelRegular(size: size)
    }
}
