//
//  NewBookCell.swift
//  ReadMe
//
//  Created by Леонид Турко on 11.09.2024.
//

import UIKit

final class NewBookCell: UITableViewCell {
  
  // MARK: - UIElements
  private var vLabelStackView = UIStackView()
  private var vTextFieldStackView = UIStackView()
  private var hStackView = UIStackView()
  
  private let titleLabel = UILabel()
  private let authorLabel = UILabel()
  
  private let titleTextField = UITextField()
  private let authorTextField = UITextField()
  
  
  // MARK: - Properties
  static let reuseIdentifier = String(describing: NewBookCell.self)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    configureSubviews()
    setupConstraints()
    setupDelegates()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension NewBookCell {
  func configure(with text: String) {
    titleLabel.text = text
  }
}

extension NewBookCell: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == titleTextField {
      return authorTextField.becomeFirstResponder()
    } else {
      return textField.resignFirstResponder()
    }
  }
}

//  MARK: - Set Views and Constraints
private extension NewBookCell {
  func setupUI() {
    // Horisontal Stack View
    hStackView.translatesAutoresizingMaskIntoConstraints = false
    hStackView.axis = .horizontal
    hStackView.distribution = .fill
    hStackView.spacing = 10
    
    // Vertical Title Stack View
    vLabelStackView.translatesAutoresizingMaskIntoConstraints = false
    vLabelStackView.axis = .vertical
    vLabelStackView.distribution = .fillEqually
    vLabelStackView.spacing = 10
    
    // Vertical Author Stack View
    vTextFieldStackView.translatesAutoresizingMaskIntoConstraints = false
    vTextFieldStackView.axis = .vertical
    vTextFieldStackView.distribution = .fillEqually
    vTextFieldStackView.spacing = 10
    
    // Title Label
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.numberOfLines = 0
    titleLabel.text = "Title"
    titleLabel.font = .preferredFont(forTextStyle: .headline)
    
    // Author Label
    authorLabel.translatesAutoresizingMaskIntoConstraints = false
    authorLabel.numberOfLines = 0
    authorLabel.text = "Author"
    authorLabel.font = .preferredFont(forTextStyle: .headline)
    
    // Title TextField
    titleTextField.translatesAutoresizingMaskIntoConstraints = false
    titleTextField.placeholder = "Title..."
    titleTextField.returnKeyType = .next
    titleTextField.borderStyle = .roundedRect
    
    // Author TextField
    authorTextField.translatesAutoresizingMaskIntoConstraints = false
    authorTextField.placeholder = "Author..."
    authorTextField.returnKeyType = .done
    authorTextField.borderStyle = .roundedRect
  }
  
  func configureSubviews() {
    vLabelStackView.addArrangedSubview(titleLabel)
    vLabelStackView.addArrangedSubview(authorLabel)
    
    vTextFieldStackView.addArrangedSubview(titleTextField)
    vTextFieldStackView.addArrangedSubview(authorTextField)
    
    hStackView.addArrangedSubview(vLabelStackView)
    hStackView.addArrangedSubview(vTextFieldStackView)
    contentView.addSubview(hStackView)
  }
  
  func setupConstraints() {
    
    NSLayoutConstraint.activate([
      hStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: hStackView.trailingAnchor, multiplier: 1),
      hStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
      hStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
  
  func setupDelegates() {
    titleTextField.delegate = self
    authorTextField.delegate = self
  }
}
