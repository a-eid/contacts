import Foundation

struct Section {
  var title: String
  var isExpanded: Bool
  var contacts: [Contact]
}

struct Contact {
  var fav: Bool
  var name: String
}
