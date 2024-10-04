//
//  UITextView+Extension.swift
//  ReadMe
//
//  Created by Леонид Турко on 10.09.2024.
//

import UIKit

extension UITextView {
  func addDoneButton() {
    let toolBar = UIToolbar()
    toolBar.sizeToFit()
    let flexButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.resignFirstResponder))
    toolBar.items = [flexButton, doneButton]
    self.inputAccessoryView = toolBar
  }
}
