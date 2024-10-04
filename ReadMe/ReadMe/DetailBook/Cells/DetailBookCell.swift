//
//  DetailBookCell.swift
//  ReadMe
//
//  Created by Леонид Турко on 09.09.2024.
//

import UIKit

final class DetailBookCell: UITableViewCell {
  
  // MARK: - UIElements
  private let hStackView = UIStackView()
  private let vStackView = UIStackView()
  
  private let titleLabel = UILabel()
  private let authorLabel = UILabel()
  
  private let markButton = UIButton(type: .system)
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: DetailBookCell.self)
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

extension DetailBookCell {
  func configure(with book: Book) {
    titleLabel.text = book.title
    authorLabel.text = book.author
  }
  
  @objc func markButtonTapped() {
    print("button is tapped")
  }
}

//  MARK: - Set Views and Constraints
private extension DetailBookCell {
  func setupUI() {
    // Horisontal StackView
    hStackView.translatesAutoresizingMaskIntoConstraints = false
    hStackView.setContentHuggingPriority(.required, for: .horizontal)
    hStackView.axis = .horizontal
    hStackView.distribution = .fill
    hStackView.alignment = .center
    hStackView.spacing = 8
    
    // Vertical StackView
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.axis = .vertical
    vStackView.distribution = .fill
    vStackView.alignment = .fill
    vStackView.isBaselineRelativeArrangement = true
    vStackView.spacing = 30
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.numberOfLines = 0
    titleLabel.font = .preferredFont(forTextStyle: .title1)
    titleLabel.text = "Title"
    
    authorLabel.translatesAutoresizingMaskIntoConstraints = false
    authorLabel.font = .preferredFont(forTextStyle: .title2)
    authorLabel.textColor = .secondaryLabel
    authorLabel.text = "Author"
    
    markButton.translatesAutoresizingMaskIntoConstraints = false
    let markButtonConfiguration = UIImage.SymbolConfiguration(pointSize: 48)
    let markButtonImage = UIImage(systemName: "bookmark.fill", withConfiguration: markButtonConfiguration)
    markButton.setImage(markButtonImage, for: .normal)
    markButton.setContentHuggingPriority(.required, for: .horizontal)
    markButton.addTarget(self, action: #selector(markButtonTapped), for: .touchUpInside)
  }
  
  func configureSubviews() {
    vStackView.addArrangedSubview(titleLabel)
    vStackView.addArrangedSubview(authorLabel)
    
    hStackView.addArrangedSubview(markButton)
    hStackView.addArrangedSubview(vStackView)
    
    contentView.addSubview(hStackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      // Horisontal StackView
      hStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
      hStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: hStackView.trailingAnchor, multiplier: 2),
      hStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      hStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
      
      // BookThumbNail
      markButton.heightAnchor.constraint(equalTo: hStackView.heightAnchor, multiplier: 0.9),
      markButton.widthAnchor.constraint(equalTo: markButton.heightAnchor, multiplier: 0.8),
    ])
  }
}
