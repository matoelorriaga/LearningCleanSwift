//
//  CreateOrderViewController.swift
//  LearningCleanSwift
//
//  Created by Matías Elorriaga on 10/11/16.
//  Copyright (c) 2016 melorriaga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateOrderViewControllerInput {
    func displaySomething(viewModel: CreateOrder.Something.ViewModel)
}

protocol CreateOrderViewControllerOutput {
    func doSomething(request: CreateOrder.Something.Request)
}

class CreateOrderViewController: UITableViewController, CreateOrderViewControllerInput, UITextFieldDelegate {
    
    var output: CreateOrderViewControllerOutput!
    var router: CreateOrderRouter!
    
    let shippingMethodPicker = UIPickerView()
    let expirationDatePicker = UIDatePicker()
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var shippingMethodTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let index = textFields.index(of: textField) {
            if index < textFields.count - 1 {
                let nextTextField = textFields[index + 1]
                nextTextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            for textField in textFields {
                if textField.isDescendant(of: cell) {
                    textField.becomeFirstResponder()
                }
            }
        }
    }
    
    func expirationDatePickerValueChanged(datePicker: UIDatePicker) {}
    
    // MARK: - Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CreateOrderConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for textField in textFields {
            textField.delegate = self
        }
        expirationDatePicker.addTarget(self, action: #selector(CreateOrderViewController.expirationDatePickerValueChanged(datePicker:)), for: .valueChanged)
        
        doSomethingOnLoad()
    }
    
    // MARK: - Event handling
    
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
        let request = CreateOrder.Something.Request()
        output.doSomething(request: request)
    }
    
    // MARK: - Display logic
    
    func displaySomething(viewModel: CreateOrder.Something.ViewModel) {
        // NOTE: Display the result from the Presenter
        
        // nameTextField.text = viewModel.name
    }
    
}
