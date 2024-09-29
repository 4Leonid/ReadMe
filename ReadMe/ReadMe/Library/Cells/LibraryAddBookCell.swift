//
//  LibraryAddBookCell.swift
//  ReadMe
//
//  Created by Леонид Турко on 03.09.2024.
//

import UIKit

final class LibraryAddBookCell: UITableViewCell {
  
  // MARK: - UIElements
  private let stackView = UIStackView()
  private let bookImage = UIImageView()
  private let titleLabel = UILabel()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: LibraryAddBookCell.self)
  
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

//  MARK: - Set Views and Constraints
extension LibraryAddBookCell {
  
  func setupUI() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.spacing = 8
    stackView.alignment = .center
    stackView.distribution = .fill
    
    bookImage.translatesAutoresizingMaskIntoConstraints = false
    bookImage.image = UIImage(systemName: "book.circle")
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = "Add new book"
    titleLabel.font = .preferredFont(forTextStyle: .title2)
  }
  
  func configureSubviews() {
    stackView.addArrangedSubview(bookImage)
    stackView.addArrangedSubview(titleLabel)
    
    contentView.addSubview(stackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
      stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
      
      bookImage.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9),
      bookImage.widthAnchor.constraint(equalTo: bookImage.heightAnchor),
    ])
  }
}
