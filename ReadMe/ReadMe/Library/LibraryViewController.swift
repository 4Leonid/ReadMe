//
//  LibraryViewController.swift
//  ReadMe
//
//  Created by Леонид Турко on 29.09.2024.
//

import UIKit

class LibraryViewController: UIViewController {
  
  // MARK: - UIElements

  
  
//  // MARK: - Private properties
  
//  var libraryView: LibraryView {
//    view as! LibraryView 
//  }

  override func loadView() {
    view = LibraryView(frame: UIScreen.main.bounds)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //libraryView.reload()
  }
}

// MARK: - UITableViewDataSource
//extension LibraryViewController: UITableViewDataSource {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    books.count + 1
//  }
//  
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    if indexPath.row == 0 {
//      guard let cell = tableView.dequeueReusableCell(withIdentifier: LibraryAddBookCell.reuseIdentifier, for: indexPath) as? LibraryAddBookCell else { return UITableViewCell() }
//      return cell
//    } else {
//      guard let cell = tableView.dequeueReusableCell(withIdentifier: LibraryCell.reuseIdentifier, for: indexPath) as? LibraryCell else { return UITableViewCell() }
//      let book = books[indexPath.row - 1]
//      cell.configure(with: book)
//      return cell
//    }
//  }
//}

// MARK: - UITableViewDelegate
//extension LibraryViewController: UITableViewDelegate {
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    if indexPath.row == 0 {
//      let book = books[indexPath.row]
//      let addBookVC = NewBookViewController()
//      navigationController?.pushViewController(addBookVC, animated: true)
//    } else {
//      let book = books[indexPath.row - 1]
//      let detailTVC = DetailViewController(book: book)
//      navigationController?.pushViewController(detailTVC, animated: true)
//    }
//  }
//}

//  MARK: - Set Views and Constraints
//private extension LibraryViewController {
//  func setupUI() {
//    libraryView.translatesAutoresizingMaskIntoConstraints = false
//  }
//  
//  func configureSubviews() {
//    view.addSubview(libraryView)
//  }
//  
//  func setupConstraints() {
//    libraryView.edgesToSuperview()
//    NSLayoutConstraint.activate([
//      // !!! ???
//    ])
//  }
//}


