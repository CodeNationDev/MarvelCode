//
import UIKit
import MarvelUIKitManager

class BaseViewController: UIViewController {
    let child = SpinnerViewController()
    
    public var navigationColor: UIColor? {
        didSet {
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = navigationColor!
        }
    }
    
    public var navigationTitleColor: UIColor? {
        didSet {
            self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: navigationTitleColor!, NSAttributedString.Key.font: UIFont.marvelRegular(size: 26)]
        }
    }
    
    public var backColor: UIColor? {
        didSet {
            self.view.backgroundColor = backColor!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    func setupView() {
        if let navcontroller = navigationController, let firstVC = navcontroller.viewControllers.first {
            if self != firstVC {
                let backButton = UIBarButtonItem(image: .back, style: .plain, target: self, action: #selector(leftTouchUpInside))
                backButton.tintColor = navigationTitleColor ?? UIColor.systemPink
                navigationItem.leftBarButtonItem = backButton
                
            }
        }
    }
    
    @objc func leftTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func showSpinner() {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func hideSpinner() {
        DispatchQueue.main.async { [self] in
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
}
