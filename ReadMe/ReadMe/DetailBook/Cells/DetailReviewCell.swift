//
//  DetailReviewCell.swift
//  ReadMe
//
//  Created by Леонид Турко on 09.09.2024.
//

import UIKit

final class DetailReviewCell: UITableViewCell {
  
  // MARK: - UIElements
  private let previewText = UITextView()
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: DetailReviewCell.self)
  static let rowHeigh: CGFloat = 200
  
  
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

extension DetailReviewCell {
  func configure(with text: String) {
    previewText.text = text
  }
}

//  MARK: - Set Views and Constraints
private extension DetailReviewCell {
  func setupUI() {
    // Title Label
    previewText.translatesAutoresizingMaskIntoConstraints = false
    previewText.text = "Review..."
    previewText.font = .preferredFont(forTextStyle: .body)
    previewText.textColor = .label
    previewText.isScrollEnabled = false
    previewText.backgroundColor = .secondarySystemBackground
    previewText.addDoneButton()
  }
  
  func configureSubviews() {
    contentView.addSubview(previewText)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      previewText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      previewText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      previewText.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: previewText.trailingAnchor, multiplier: 2),
      previewText.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      previewText.heightAnchor.constraint(equalToConstant: 200),
    ])
  }
}
