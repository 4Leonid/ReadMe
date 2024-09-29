//
//  LibraryCell.swift
//  ReadMe
//
//  Created by Леонид Турко on 29.09.2024.
//

import UIKit

final class LibraryCell: UITableViewCell {
  
  // MARK: - UIElements
  private let hStackView = UIStackView()
  private let vStackView = UIStackView()
  
  private let titleLabel = UILabel()
  private let authorLabel = UILabel()
  private let reviewLabel = UILabel()
  
  private let bookThumbnail = UIImageView()
  private let readMeBookmark = UIImageView()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: LibraryCell.self)
  static let rowHeigh: CGFloat = 100
  
  
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

extension LibraryCell {
  func configure(with book: Book) {
    titleLabel.text = book.title
    authorLabel.text = book.author
    bookThumbnail.image = book.image
  }
}

//  MARK: - Set Views and Constraints
private extension LibraryCell {
  func setupUI() {
    // Horisontal StackView
    hStackView.translatesAutoresizingMaskIntoConstraints = false
    hStackView.axis = .horizontal
    hStackView.distribution = .fill
    hStackView.alignment = .center
    hStackView.spacing = 16
    
    // Vertical StackView
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.axis = .vertical
    vStackView.distribution = .fill
    vStackView.alignment = .fill
    vStackView.isBaselineRelativeArrangement = true
    vStackView.spacing = 24
    
    bookThumbnail.translatesAutoresizingMaskIntoConstraints = false
    let bookConfiguration = UIImage.SymbolConfiguration(weight: .light)
    bookThumbnail.image = UIImage(systemName: "t.square", withConfiguration: bookConfiguration)
    bookThumbnail.contentMode = .scaleAspectFill
    bookThumbnail.tintColor = .placeholderText
    bookThumbnail.layer.cornerRadius = 12
    bookThumbnail.layer.masksToBounds = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.numberOfLines = 1
    titleLabel.font = .preferredFont(forTextStyle: .title2)
    
    authorLabel.translatesAutoresizingMaskIntoConstraints = false
    authorLabel.font = .preferredFont(forTextStyle: .title3)
    authorLabel.textColor = .secondaryLabel
    
    reviewLabel.translatesAutoresizingMaskIntoConstraints = false
    reviewLabel.font = .preferredFont(forTextStyle: .subheadline)
    reviewLabel.text = "Review"
    reviewLabel.isHidden = true
    
    readMeBookmark.translatesAutoresizingMaskIntoConstraints = false
    let markConfiguration = UIImage.SymbolConfiguration(pointSize: 28)
    readMeBookmark.image = UIImage(systemName: "bookmark.fill", withConfiguration: markConfiguration)
    readMeBookmark.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    readMeBookmark.isHidden = true
  }
  
  func configureSubviews() {
    vStackView.addArrangedSubview(titleLabel)
    vStackView.addArrangedSubview(authorLabel)
    vStackView.addArrangedSubview(reviewLabel)
    
    hStackView.addArrangedSubview(bookThumbnail)
    hStackView.addArrangedSubview(vStackView)
    hStackView.addArrangedSubview(readMeBookmark)
    
    contentView.addSubview(hStackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      // Horisontal StackView
      hStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: hStackView.trailingAnchor, multiplier: 2),
      hStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      hStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
      
      // BookThumbNail
      bookThumbnail.heightAnchor.constraint(equalTo: hStackView.heightAnchor, multiplier: 0.9),
      bookThumbnail.widthAnchor.constraint(equalTo: bookThumbnail.heightAnchor),
    ])
  }
}
