import UIKit
import ios_essentials

class Home: UITableViewController {
  let nCell = "nCell"
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Contacts"
    navigationController?.navigationBar.prefersLargeTitles = true
    tableView.alwaysBounceVertical = true
    tableView.register(UITableViewCell.self , forCellReuseIdentifier: nCell)
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let l = UILabel()
    l.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    l.text = "header"
    return l
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: nCell, for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }

}

