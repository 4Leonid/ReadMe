//
//  LibraryViewController.swift
//  ReadMe
//
//  Created by Леонид Турко on 29.09.2024.
//

import UIKit

enum TableRow: Int, CaseIterable {
  case addBook
  case book
}

class LibraryViewController: UIViewController {
  
  // MARK: - UIElements
  private lazy var tableView =  UITableView()
  
  private let books = Library.books
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "My Library"
    setupViews()
  }
}

// MARK: - UITableViewDataSource
extension LibraryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    books.count + 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    let tableRow = TableRow(rawValue: indexPath.row)
    switch tableRow {
    case .addBook:
      guard let addBookCell = tableView.dequeueReusableCell(withIdentifier: LibraryAddBookCell.reuseIdentifier, for: indexPath) as? LibraryAddBookCell else { return UITableViewCell() }
      cell = addBookCell
   default:
      guard let bookCell = tableView.dequeueReusableCell(withIdentifier: LibraryCell.reuseIdentifier, for: indexPath) as? LibraryCell else { return UITableViewCell() }
      let book = books[indexPath.row - 1]
      bookCell.configure(with: book)
      cell = bookCell
    }
    return cell
  }
}

// MARK: - UITableViewDelegate
extension LibraryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

//  MARK: - Set Views and Constraints
extension LibraryViewController {
  
  func setupViews() {
    // TableView
    tableView.register(LibraryCell.self, forCellReuseIdentifier: LibraryCell.reuseIdentifier)
    tableView.register(LibraryAddBookCell.self, forCellReuseIdentifier: LibraryAddBookCell.reuseIdentifier)
    tableView.rowHeight = LibraryCell.rowHeigh
    
    view.addSubview(tableView)
    setupConstraints()
    setupDelegates()
  }
  
  
  func setupConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
  func setupDelegates() {
    tableView.dataSource = self
    tableView.delegate = self
  }
}


