//
import Foundation
import UIKit

public class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    /// Overrides loadView function for create the spinner.
    public override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
