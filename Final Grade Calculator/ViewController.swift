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
    var desiredGrade = UITextField()
    var semesterWeight = UITextField()
    var finalWeight = UITextField()
    var entryStack = UIStackView()
    var weightStack = UIStackView()
    var GradeNeeded = UILabel()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.becomeFirstResponder()
        view.backgroundColor = UIColor.black
        
        entryStack.axis = .vertical
        entryStack.alignment = UIStackView.Alignment.fill
        entryStack.distribution = UIStackView.Distribution.equalSpacing
        entryStack.spacing = 10
        entryStack.addArrangedSubview(GradeNeeded)
        entryStack.addArrangedSubview(currentGrade)
        entryStack.addArrangedSubview(weightStack)
        entryStack.addArrangedSubview(desiredGrade)
        self.view.addSubview(entryStack)
        entryStack.translatesAutoresizingMaskIntoConstraints = false
        entryStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        entryStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        entryStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        
        weightStack.axis = .horizontal
        weightStack.alignment = UIStackView.Alignment.center
        weightStack.distribution = UIStackView.Distribution.equalCentering
        weightStack.spacing = 10
        weightStack.addArrangedSubview(semesterWeight)
        weightStack.addArrangedSubview(finalWeight)
        
        textFieldSetup(arg: currentGrade, arg: "  Enter the average of your Q1 & Q2 grades")
        textFieldSetup(arg: semesterWeight, arg: "  Enter semester weight")
        textFieldSetup(arg: finalWeight, arg: "  Enter final exam weight")
        textFieldSetup(arg: desiredGrade, arg: "  Enter your desired grade")
        
        GradeNeeded.textColor = UIColor.white
    }
    func textFieldSetup (arg txtFld: UITextField, arg placeholder: String)
    {
        txtFld.delegate = self
        txtFld.backgroundColor = UIColor.darkGray
        txtFld.textColor = UIColor.white
        txtFld.attributedPlaceholder = NSAttributedString(string: txtFld.placeholder != nil ? txtFld.placeholder! : placeholder, attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        txtFld.font = UIFont.systemFont(ofSize: 17)
        txtFld.borderStyle = UITextField.BorderStyle.roundedRect
        txtFld.autocorrectionType = UITextAutocorrectionType.yes
        txtFld.keyboardType = UIKeyboardType.decimalPad
        txtFld.returnKeyType = UIReturnKeyType.done
        txtFld.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        calculate(arg: Double(currentGrade.text ?? "1.0")!, arg: (Double(semesterWeight.text ?? "1.0")!)/100, arg: (Double(finalWeight.text ?? "1.0")!)/100, arg: Double(desiredGrade.text ?? "1.0")!)
        return true
    }
    func calculate (arg current: Double, arg sWeight: Double, arg fWeight: Double, arg desired: Double)
    {
        GradeNeeded.text = String(-((current * sWeight) - desired) / fWeight)
    }
}

