//
//  FileManager+Extensions.swift
//  ReadMe
//
//  Created by Леонид Турко on 30.09.2024.
//

import Foundation

extension FileManager {
  static var documentDirectoryURL: URL {
    `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
