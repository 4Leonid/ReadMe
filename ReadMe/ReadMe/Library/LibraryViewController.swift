//
//  LibraryViewController.swift
//  ReadMe
//
//  Created by Леонид Турко on 29.09.2024.
//

import UIKit

class LibraryViewController: UIViewController {
  
  // MARK: - UIElements

  
  
//  // MARK: - Private properties
  
// var libraryView: LibraryView {
//    view as! LibraryView
//  }

  override func loadView() {
    view = LibraryView(frame: UIScreen.main.bounds)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "My Library"
    view.backgroundColor = .white
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //libraryView.reload()
  }
}

//  MARK: - Set Views and Constraints
//private extension LibraryViewController {
//  func setupUI() {
//    libraryView.translatesAutoresizingMaskIntoConstraints = false
//  }
//  
//  func configureSubviews() {
//    view.addSubview(libraryView)
//  }
//  
//  func setupConstraints() {
//    libraryView.edgesToSuperview()
//    NSLayoutConstraint.activate([
//      // !!! ???
//    ])
//  }
//}


