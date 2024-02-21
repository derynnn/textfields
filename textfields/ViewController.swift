//
//  ViewController.swift
//  textfields
//
//  Created by Anastasia Tochilova  on 13.02.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: - UI Elements
    let label = UILabel()
    let textField = UITextField()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Label Setup
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(label)

        // MARK: - Text Field Setup
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.delegate = self
        textField.returnKeyType = .go
        view.addSubview(textField)

        // MARK: - UI Methods
        NSLayoutConstraint.activate([
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        label.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let range = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: range, with: string)
            label.text = updatedText
        }
        return true
    }
}
