import UIKit
import ios_essentials

class ContactCell: UITableViewCell {
  
  weak var home: Home!
  
  let label: UILabel = {
    let l = UILabel()
    return l
  }()
  
  let starView: UIButton = {
    let b = UIButton(type: .system)
    b.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
    
    b.setImage(#imageLiteral(resourceName: "star"), for: .normal)
    b.tintColor = .red
    b.imageView?.contentMode = .scaleAspectFit
    return b
  }()
  

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  func setupViews(){
    addSubview(label)
    _ = label.anchorEdges(top: topAnchor, left: leftAnchor, right: nil, bottom: bottomAnchor)
    _ = label.anchorWH(width: widthAnchor, wMultiplier: 0.7, height: nil, hMultiplier: 0)
    accessoryView = starView
    starView.addTarget(self, action: #selector(toggleFav), for: .touchUpInside)
    
  }
  
  @objc func toggleFav(){
    home.toggleFav(cell: self)
  }
  
  func updateViews(label: String?, fav: Bool?){
    if let label = label {
      self.label.text = label
    }
    if let fav = fav {
      accessoryView?.tintColor = (fav ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) )
    }
  }
  

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

