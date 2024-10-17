//
//  NewBookImageCell.swift
//  ReadMe
//
//  Created by Леонид Турко on 11.09.2024.
//

import UIKit

protocol NewBookImageCellDelegate: AnyObject {
  func didUpdatePhoto()
}

final class NewBookImageCell: UITableViewCell {
  // MARK: - UIElements
  private let stackView = UIStackView()
  private let bookImageView = UIImageView()
  private let updateButton = UIButton(type: .system)
  
  weak var delegate: NewBookImageCellDelegate?
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: NewBookImageCell.self)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Actions
extension NewBookImageCell {
  func configure(with book: Book) {
    bookImageView.image = book.image
  }
  
  func update(_ image: UIImage?) {
    bookImageView.image = image
  }
  
  @objc func addButtonTapped() {
    guard let delegate else { return }
    delegate.didUpdatePhoto()
  }
}

//  MARK: - Set Views and Constraints
 extension NewBookImageCell {
  func setupUI() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8
    
    bookImageView.translatesAutoresizingMaskIntoConstraints = false
    bookImageView.image = UIImage(systemName: "book.circle")
    bookImageView.layer.cornerRadius = 16
    bookImageView.layer.masksToBounds = true
    
    updateButton.translatesAutoresizingMaskIntoConstraints = false
    updateButton.setTitle("Add Image...", for: .normal)
    updateButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
    updateButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
  }
  
  func configureSubviews() {
    stackView.addArrangedSubview(bookImageView)
    stackView.addArrangedSubview(updateButton)
    
    contentView.addSubview(stackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
      stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
      
      bookImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
      bookImageView.heightAnchor.constraint(equalTo: bookImageView.widthAnchor),
    ])
  }
}
