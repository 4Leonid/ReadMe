//
//  LibraryView.swift
//  ReadMe
//
//  Created by Леонид Турко on 29.09.2024.
//

import UIKit

final class LibraryView: UIView {
  
  private var libraryTableView = LibraryTableView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    setupUI()
    configureSubviews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LibraryView {
  func setupUI() {
    libraryTableView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func configureSubviews() {
    addSubview(libraryTableView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      libraryTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      libraryTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      libraryTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      libraryTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
   
  }
}
