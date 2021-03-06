//
import Foundation
import UIKit

public class MarvelTextView: UITextView {
    @IBInspectable public var fontSize: CGFloat = 12 {
        didSet{
            font = .marvelRegular(size: fontSize)
            setupView()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private func setupView() {
        textColor = .marvelBlack1
        layer.borderWidth = 4.0
        layer.borderColor = UIColor.marvelBlack1.cgColor
        layer.backgroundColor = UIColor.spidermanGray.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        
    }
}
