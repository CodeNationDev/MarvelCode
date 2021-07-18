//
//  BaseViewController.swift
//  MarvelCode
//
//  Created by david.martin.saiz on 17/07/2021.
//

import UIKit

class BaseViewController: UIViewController {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
