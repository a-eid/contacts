import UIKit
import ios_essentials

class Home: UITableViewController {
  let nCell = "nCell"
  var sections: [Section] = [
    Section(title: "First", isExpanded: true, contacts: [
      Contact(fav: false, name: "one"),
      Contact(fav: false, name: "two"),
      Contact(fav: false, name: "three"),
      Contact(fav: false, name: "one"),
      Contact(fav: false, name: "two"),
      Contact(fav: false, name: "three"),
    ]),
    Section(title: "Second", isExpanded: true,contacts: [
      Contact(fav: false, name: "four"),
      Contact(fav: false, name: "five"),
      Contact(fav: false, name: "six"),
      Contact(fav: false, name: "four"),
      Contact(fav: false, name: "five"),
      Contact(fav: false, name: "six"),
    ]),
    Section(title: "Third", isExpanded: true, contacts: [
      Contact(fav: false, name: "seven"),
      Contact(fav: false, name: "eight"),
      Contact(fav: false, name: "ten"),
      Contact(fav: false, name: "seven"),
      Contact(fav: false, name: "eight"),
      Contact(fav: false, name: "ten")
    ]),
  ]
  
  var toLeft = true

  override func viewDidLoad() {
   
    super.viewDidLoad()
    tableView.allowsSelection = false
    navigationItem.title = "Contacts"
    navigationController?.navigationBar.prefersLargeTitles = true
    tableView.alwaysBounceVertical = true
    tableView.register(ContactCell.self , forCellReuseIdentifier: nCell)
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
    
    for section in sections.indices {
      for row in sections[section].contacts.indices {
        ip.append(IndexPath(row: row, section: section))
      }
    }
    
    toLeft = !toLeft
    let animation: UITableViewRowAnimation = toLeft ? .left : .right

    tableView.reloadRows( at: ip, with: animation )
  }
  
  @objc func reloadSection(){
    var ip = [IndexPath]()
    
    for i in sections[0].contacts.indices {
      ip.append(IndexPath(row: i, section: 0))
    }
    
    tableView.reloadRows(at: ip, with: .left)
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let b = UIButton(type: .system)
    b.setTitle(sections[section].title, for: .normal)
    b.setTitleColor(.black, for: .normal)
    b.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    b.tag = section
    b.addTarget(self, action: #selector(handleHeaderTap), for: .touchUpInside)
    return b
  }
  
  @objc func handleHeaderTap(b: UIButton){
    let section = b.tag
    
    sections[section].isExpanded = !sections[section].isExpanded
    
    var ips = [IndexPath]()
    for i in sections[section].contacts.indices {
      ips.append(IndexPath(row: i, section: section))
    }
    
    if sections[section].isExpanded {
      tableView.insertRows(at: ips, with: .bottom)
    }else {
      tableView.deleteRows(at: ips, with: .top)
    }

  }
  
  func toggleFav(cell: ContactCell){
    guard let indexPath = tableView.indexPath(for: cell) else { return }
    sections[indexPath.section].contacts[indexPath.row].fav = !sections[indexPath.section].contacts[indexPath.row].fav
    cell.updateViews(label: nil, fav: sections[indexPath.section].contacts[indexPath.row].fav )
    tableView.reloadRows(at: [indexPath], with: .none)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].isExpanded ? sections[section].contacts.count: 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: nCell, for: indexPath) as! ContactCell
    let contact = sections[indexPath.section].contacts[indexPath.row]
    cell.updateViews(label: contact.name , fav: contact.fav)
    cell.home = self
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 36
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 36
  }

}

