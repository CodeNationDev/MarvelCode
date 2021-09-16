//
import UIKit
import MarvelUIKitManager
import SwiftMagicHelpers

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
    
    
    /// Function for setup navigation controller back button
    func setupView() {
        if let navcontroller = navigationController, let firstVC = navcontroller.viewControllers.first {
            if self != firstVC {
                let backButton = UIBarButtonItem(image: .back, style: .plain, target: self, action: #selector(leftTouchUpInside))
                backButton.tintColor = navigationTitleColor ?? UIColor.systemPink
                navigationItem.leftBarButtonItem = backButton
                
            }
        }
    }
    
    
    /// Action of back button.
    @objc func leftTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    
    /// Function for show spinner at loading time.
    func showSpinner() {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    /// Function for hide spinner when task finished.
    func hideSpinner() {
        DispatchQueue.main.async { [self] in
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
    
    func showExitAlert(title: String ,message: String, actionTitle: String? = "OK") {
        
        let alertAction =  UIAlertAction(title: actionTitle, style: .default) { _ in
            UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
            //Minimize and kill app.
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                exit(0)
            }
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
}
