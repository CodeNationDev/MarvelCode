//
import Foundation
import UIKit

protocol MainViewProtocol: class {
    func updateCharactersData(results: [Result])
}

class MainView: UIViewController  {
    @IBOutlet weak var tableView: UITableView!
    var limit: Int = 100
    var offset: Int = 0
    var mainVM: MainViewModel?
    var characters: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainVM = MainViewModel()
        setupTable()
        guard let viewmodel = mainVM else { return }
        viewmodel.loadData { [self] (results) in
            characters = results
            print(results)
            tableView.reloadData()
        }
    }
    
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.Views.TableViewCells.characterCell , bundle: .main), forCellReuseIdentifier: Constants.Views.TableViewCells.characterCell)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 90
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
        characters.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CharacterCell {
            cell.viewColor = .spidermanRed
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CharacterCell {
            cell.viewColor = .spidermanWhite
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == characters.count - 5 {
            offset += 100
            DispatchQueue.main.async { [self] in
                guard let viewmodel = mainVM else { return }
                viewmodel.loadData(limit: limit, offset: offset) { [self] (results) in
                    characters += results
                    tableView.reloadData()
                }
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Views.TableViewCells.characterCell) as! CharacterCell
            guard let name = characters[indexPath.row].name else { return UITableViewCell() }
            cell.name = name
            cell.configureCell()
            
            return cell;
    }
}
