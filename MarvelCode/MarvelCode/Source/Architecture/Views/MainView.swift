//
import Foundation
import UIKit
import MarvelUIKitManager

protocol MainViewProtocol: class {
    func updateCharactersData(results: [Result])
}

class MainView: BaseViewController  {
    @IBOutlet weak var tableView: UITableView!
    var limit: Int = 100
    var offset: Int = 0
    var mainVM = MainViewModel()
    var characters: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationColor = .spidermanBlue
        navigationTitleColor = .spidermanRed
        title = Constants.Views.ViewControllers.main.uppercased()
        setupTable()
        showSpinner()
        mainVM.loadData { [self] (result) in
            tableView.reloadData()
            hideSpinner()
        }
    }
    
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.Views.TableViewCells.characterCell , bundle: .main), forCellReuseIdentifier: Constants.Views.TableViewCells.characterCell)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MainView: MainViewProtocol {
    func updateCharactersData(results: [Result]) {
        print(results)
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainVM.results.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterSelected = mainVM.results[indexPath.row]
        Router.routeToCharacterDetail(characterData: characterSelected)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CharacterCell {
            cell.viewColor = .spidermanWhite
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == mainVM.results.count - 20 {
            showSpinner()
            offset += 100
            DispatchQueue.main.async { [self] in
                mainVM.loadData(limit: limit, offset: offset) { (result) in
                    tableView.reloadData()
                    hideSpinner()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Views.TableViewCells.characterCell) as! CharacterCell
        cell.configureCell(data: mainVM.results[indexPath.row])
        return cell;
    }
}
