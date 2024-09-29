//
//  Book.swift
//  ReadMe
//
//  Created by Леонид Турко on 28.08.2024.
//

import UIKit

struct Book {
  let title: String
  let author: String
  var review: String?
  
  var image: UIImage {
    Library.loadImage(forBook: self)
    ?? LibrarySimbol.letterSquare(letter: title.first).image
  }
}
