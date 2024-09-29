//
//  Library.swift
//  ReadMe
//
//  Created by Леонид Турко on 29.08.2024.
//

import UIKit

enum LibrarySimbol {
  case bookmark
  case bookmarkFill
  case book
  case letterSquare(letter: Character?)
  
  var image: UIImage {
    let imageName: String
    
    switch self {
    case .bookmark, .book:
      imageName = "\(self)"
    case .bookmarkFill:
      imageName = "bookmark.fill"
    case .letterSquare(let letter):
      guard
        let letter = letter?.lowercased(),
        let image = UIImage(systemName: "\(letter).square")
      else {
        imageName = "square"
        break
      }
      return image
    }
    return UIImage(systemName: imageName)!
  }
}

protocol ILibrary {
  func fetchBooks() -> [Book]
}

enum Library: ILibrary {
  
  func fetchBooks() -> [Book] {
    return Library.books
  }
  
  
  static let books: [Book] = [
    Book(title: "Ein Neues Land", author: "Shaun Tan"),
    Book(title: "Bosch", author: "Laurinda Dixon"),
    Book(title: "Dare to Lead", author: "Brené Brown"),
    Book(title: "Blasting for Optimum Health Recipe Book", author: "NutriBullet"),
    Book(title: "Drinking with the Saints", author: "Michael P. Foley"),
    Book(title: "A Guide to Tea", author: "Adagio Teas"),
    Book(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson"),
    Book(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington"),
    Book(title: "How to Draw Cats", author: "Janet Rancan"),
    Book(title: "Drawing People", author: "Barbara Bradley"),
    Book(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter")
  ]
  
  static func saveImage(_ image: UIImage, forBook book: Book)  {
    let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(book.title)
    if let jpgData = image.jpegData(compressionQuality: 0.7) {
      try? jpgData.write(to: imageURL, options: .atomicWrite)
    }
  }
  
  static func loadImage(forBook book: Book) -> UIImage? {
    let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(book.title)
    return UIImage(contentsOfFile: imageURL.path)
  }
}

// !!! Можно вынести в отдельный файл FileManager + Extensions
extension FileManager {
  static var documentDirectoryURL: URL {
    `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
