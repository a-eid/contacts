import UIKit
import ios_essentials

class Home: UITableViewController {
  let nCell = "nCell"
  let names = [
    ["one", "two", "three"],
    ["four", "five", "six", "what"],
    ["seven", "eight", "nine", "ten", "tweleve"]
  ]
  
  let headerTitles = [
    "first", "second", "third"
  ]

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
    l.text = headerTitles[section]
    return l
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return names.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names[section].count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: nCell, for: indexPath)
    cell.textLabel?.text = names[indexPath.section][indexPath.row]
    return cell
  }

}

