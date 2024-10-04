//
//  DetailImageCell.swift
//  ReadMe
//
//  Created by Леонид Турко on 09.09.2024.
//

import UIKit

protocol DetailImageCellDelegate: AnyObject {
  func updatePhoto()
}

final class DetailImageCell: UITableViewCell {
  
  // MARK: - UIElements
  private let stackView = UIStackView()
  private let bookImageView = UIImageView()
  private let updateButton = UIButton(type: .system)
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: DetailImageCell.self)
  static let rowHeigh: CGFloat = 350
  
  weak var delegate: DetailImageCellDelegate?
  
  
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

extension DetailImageCell {
  func configure(with book: Book) {
    bookImageView.image = book.image
  }
  
  func configureImage(with image: UIImage) {
    bookImageView.image = image
  }
  
  func updateImage(image: UIImage?) {
    guard let image else { return }
    bookImageView.image = image
  }
}

//  MARK: - Set Views and Constraints
private extension DetailImageCell {
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
    updateButton.setTitle("Update Image...", for: .normal)
    updateButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
    updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
  }
  
  func configureSubviews() {
    stackView.addArrangedSubview(bookImageView)
    stackView.addArrangedSubview(updateButton)
    
    contentView.addSubview(stackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      
      stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      
      bookImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7),
      bookImageView.heightAnchor.constraint(equalTo: bookImageView.widthAnchor),
    ])
  }
  
  
  @objc func updateButtonTapped() {
    guard let delegate else { return }
    delegate.updatePhoto()
  }
}

