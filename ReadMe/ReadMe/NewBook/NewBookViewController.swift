//
//  NewBookViewController.swift
//  ReadMe
//
//  Created by Леонид Турко on 13.09.2024.
//

import UIKit

final class NewBookViewController: UIViewController {
  
  // MARK: - UIElements
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(NewBookCell.self, forCellReuseIdentifier: NewBookCell.reuseIdentifier)
    tableView.register(NewBookImageCell.self, forCellReuseIdentifier: NewBookImageCell.reuseIdentifier)
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    return tableView
  }()

  // MARK: - Private Properties
  private let numberOfRows = 2
  private var selectedImage: UIImage?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
}

 // MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension NewBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    guard
      let selectedImage = info[.editedImage] as? UIImage
    else { return }
    self.selectedImage = selectedImage
    tableView.reloadData()
    dismiss(animated: true)
  }
}

// MARK: - UITableViewDataSource
extension NewBookViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    numberOfRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    switch indexPath.row {
    case 0:
      guard let bookCell = tableView.dequeueReusableCell(withIdentifier: NewBookCell.reuseIdentifier, for: indexPath) as? NewBookCell else { return UITableViewCell() }
      cell = bookCell
    default:
      guard let imageCell = tableView.dequeueReusableCell(withIdentifier: NewBookImageCell.reuseIdentifier, for: indexPath) as? NewBookImageCell else { return UITableViewCell() }
      imageCell.delegate = self
      guard let select = self.selectedImage else {
        return imageCell
      }
      imageCell.update(select)
      cell = imageCell
      
    }
    return cell
  }
}

extension NewBookViewController: NewBookImageCellDelegate {
  func didUpdatePhoto() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera)
    ? .camera
    : .photoLibrary
    imagePicker.allowsEditing = true
    present(imagePicker, animated: true)
  }
}


//  MARK: - Set Views and Constraints
extension NewBookViewController {
  
  func setupViews() {
    view.backgroundColor = .white
    view.addSubview(tableView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}
