//
import Foundation
import UIKit

protocol MainViewProtocol: class {
    func updateCharactersData(results: [Result])
}

class MainView: UIViewController  {
    @IBOutlet weak var tableView: UITableView!
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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 128
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Views.TableViewCells.characterCell) as! CharacterCell
            guard let name = characters[indexPath.row].name else { return UITableViewCell() }
            cell.name = name
            cell.configureCell()
            
            return cell;
    }
}
