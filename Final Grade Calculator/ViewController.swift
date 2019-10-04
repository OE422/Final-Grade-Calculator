//
//  ViewController.swift
//  Final Grade Calculator
//
//  Created by  on 10/4/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    var currentGrade = UITextField()
    var gradeWeight = UITextField()
    var desiredGrade = UITextField()
    var entryStack = UIStackView()
    var GradeNeeded = UILabel()
    var weightFormat = UILabel()//Presents the user with the expected format for grade weight within the gradeWeight TextField
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.becomeFirstResponder()
        view.backgroundColor = UIColor.black
        
        entryStack.axis = .vertical
        entryStack.alignment = UIStackView.Alignment.fill
//        entryStack.setCustomSpacing(10.0, after: GradeNeeded)
//        entryStack.setCustomSpacing(5.0, after: gradeWeight)
//        entryStack.setCustomSpacing(10.0, after: weightFormat)
        
        //why doesn't the above work?
        entryStack.addArrangedSubview(GradeNeeded)
        entryStack.addArrangedSubview(currentGrade)
        entryStack.addArrangedSubview(gradeWeight)
        entryStack.addArrangedSubview(weightFormat)
        entryStack.addArrangedSubview(desiredGrade)
        self.view.addSubview(entryStack)
        entryStack.translatesAutoresizingMaskIntoConstraints = false
//        entryStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
//        entryStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        entryStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        weightFormat.text = "Ex: 80/20"
        weightFormat.textColor = UIColor.lightGray
        
        textFieldSetup(arg: currentGrade, arg: "  Enter your current grade")
        textFieldSetup(arg: gradeWeight, arg: "  Enter semester/final grade weight")
        textFieldSetup(arg: desiredGrade, arg: "  Enter your desired grade")
    }
    func textFieldSetup (arg txtFld: UITextField, arg placeholder: String)
    {
        txtFld.delegate = self
        txtFld.backgroundColor = UIColor.darkGray
        txtFld.textColor = UIColor.white
        txtFld.attributedPlaceholder = NSAttributedString(string: txtFld.placeholder != nil ? txtFld.placeholder! : placeholder, attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txtFld.font = UIFont.systemFont(ofSize: 17)
        txtFld.borderStyle = UITextField.BorderStyle.line
        txtFld.autocorrectionType = UITextAutocorrectionType.yes
        txtFld.keyboardType = UIKeyboardType.decimalPad
        if (txtFld.text != "")
        {
            txtFld.clearButtonMode = .always
        }
        else
        {
            txtFld.clearButtonMode = .whileEditing//trying to make it like apple, gonna have to come back to this to make it work properly
        }
        txtFld.returnKeyType = UIReturnKeyType.done
        txtFld.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }


}

