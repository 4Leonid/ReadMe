//
//  LibraryViewController.swift
//  ReadMe
//
//  Created by Леонид Турко on 29.09.2024.
//

import UIKit

enum TableSection: Int, CaseIterable {
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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource
extension LibraryViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    section == 0 ? 1 : books.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    let tableRow = TableSection(rawValue: indexPath.section)
    switch tableRow {
    case .addBook:
      guard let addBookCell = tableView.dequeueReusableCell(withIdentifier: LibraryAddBookCell.reuseIdentifier, for: indexPath) as? LibraryAddBookCell else { return UITableViewCell() }
      cell = addBookCell
   default:
      guard let bookCell = tableView.dequeueReusableCell(withIdentifier: LibraryCell.reuseIdentifier, for: indexPath) as? LibraryCell else { return UITableViewCell() }
      let book = books[indexPath.row]
      bookCell.configure(with: book)
      cell = bookCell
    }
    return cell
  }
}

// MARK: - UITableViewDelegate
extension LibraryViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    section == 1 ? "Read Me!" : nil
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let tableRow = TableSection(rawValue: indexPath.row)
    switch tableRow {
    case .addBook:
      showNewBookViewController(for: indexPath)
    default:
      showDetailViewController(for: indexPath)
    }
  }
}

// MARK: - Private Methods
extension LibraryViewController {
  private func showDetailViewController(for indexPath: IndexPath) {
    let detailVC = DetailViewController()
    let book = books[indexPath.row]
    detailVC.book = book
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  private func showNewBookViewController(for indexPath: IndexPath) {
    let newBookVC = NewBookViewController()
    navigationController?.pushViewController(newBookVC, animated: true)
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


