//
//  DetailViewController.swift
//  ReadMe
//
//  Created by Леонид Турко on 04.10.2024.
//

import UIKit

enum DetailTableRow: Int, CaseIterable {
  case book
  case image
  case review
}

class DetailViewController: UIViewController {
  
  // MARK: - UIElements
  private let tableView = UITableView()
  
  // MARK: - Private Properties
  private let numberOfRows = 3
  private var selectedImage: UIImage?
  
  var book: Book?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupUI()
    configureSubviews()
    setupConstraints()
    setupDelegates()
  }
}

// MARK: - Actions
extension DetailViewController: DetailImageCellDelegate {
  func updatePhoto() {
    let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .photoLibrary
    imagePicker.allowsEditing = true
    present(imagePicker, animated: true)
  }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard
      let selectedImage = info[.editedImage] as? UIImage,
      let book
    else { return }
    Library.saveImage(selectedImage, forBook: book)
    self.selectedImage = selectedImage
    tableView.reloadData()
    dismiss(animated: true)
  }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    numberOfRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let book else { fatalError() }
    let tableRow = DetailTableRow(rawValue: indexPath.row)
    switch tableRow {
    case .book:
      guard let bookCell = tableView.dequeueReusableCell(withIdentifier: DetailBookCell.reuseIdentifier, for: indexPath) as? DetailBookCell else { return UITableViewCell() }
      bookCell.configure(with: book)
      return bookCell
    case .image:
      guard let imageCell = tableView.dequeueReusableCell(withIdentifier: DetailImageCell.reuseIdentifier, for: indexPath) as? DetailImageCell else { return UITableViewCell() }
      imageCell.configure(with: book)
      imageCell.updateImage(image: selectedImage)
      imageCell.delegate = self
      return imageCell
    default:
      guard let reviewCell = tableView.dequeueReusableCell(withIdentifier: DetailReviewCell.reuseIdentifier, for: indexPath) as? DetailReviewCell else { return UITableViewCell() }
      if let review = book.review {
        reviewCell.configure(with: review)
      }
      return reviewCell
    }
  }
}

// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

//  MARK: - Set Views and Constraints
extension DetailViewController {
  func setupUI() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(DetailBookCell.self, forCellReuseIdentifier: DetailBookCell.reuseIdentifier)
    tableView.register(DetailImageCell.self, forCellReuseIdentifier: DetailImageCell.reuseIdentifier)
    tableView.register(DetailReviewCell.self, forCellReuseIdentifier: DetailReviewCell.reuseIdentifier)
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
  }
  
  func configureSubviews() {
    view.addSubview(tableView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
  
  func setupDelegates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

