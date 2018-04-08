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
  
  var toLeft = true

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Contacts"
    navigationController?.navigationBar.prefersLargeTitles = true
    tableView.alwaysBounceVertical = true
    tableView.register(UITableViewCell.self , forCellReuseIdentifier: nCell)
    navigationItem.leftBarButtonItems = [
      UIBarButtonItem(title: "r1", style: .plain, target: self, action: #selector(reloadOne)),
      UIBarButtonItem(title: "rs", style: .plain, target: self, action: #selector(reloadSection)),
      UIBarButtonItem(title: "rAll", style: .plain, target: self, action: #selector(reloadAll)),
    ]
  }
  
  @objc func reloadOne(){
    let ip = IndexPath(row: 0, section: 0)
    tableView.reloadRows(at: [ip], with: .left)
  }
  
  @objc func reloadAll(){
    var ip = [IndexPath]()
    
    for section in names.indices {
      for row in names[section].indices {
        ip.append(IndexPath(row: row, section: section))
      }
    }
    
    toLeft = !toLeft
    let animation: UITableViewRowAnimation = toLeft ? .left : .right

    tableView.reloadRows( at: ip, with: animation )
  }
  
  @objc func reloadSection(){
    var ip = [IndexPath]()
    
    for i in names[0].indices {
      ip.append(IndexPath(row: i, section: 0))
    }
    
    tableView.reloadRows(at: ip, with: .left)
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
    cell.textLabel?.text = names[indexPath.section][indexPath.row] + ( toLeft ? "   Something" : "" )
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 35
  }

}

