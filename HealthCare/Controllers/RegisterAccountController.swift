//
//  RegisterAccountController.swift
//  HealthCare
//
//  Created by Евгений on 9/23/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

public class RegisterAccountController: UIViewController {
    
    var emailField: TitleTextField!
    var passwordField: TitleTextField!
    var confirmPasswordField: TitleTextField!
    var firstNameField: TitleTextField!
    var lastNameField: TitleTextField!
    var nextButton: AppRadiusButtonView!
    
    override public func viewDidLoad() {
        self.view.backgroundColor = .white
        super.viewDidLoad()
        
        self.emailField = TitleTextField()
        self.emailField.ValidationCommand = { text in
            if(text.count > 5) {
                return true
            }
            else{
                return false
            }
        }
        self.view.addSubview(emailField)
        
        self.passwordField = TitleTextField()
        self.passwordField.ValidationCommand = { text in
            if(text.count>7 && text.count<17){
                return true
            }
            else{
                return false
            }
        }
        self.view.addSubview(passwordField)
        
        self.confirmPasswordField = TitleTextField()
        self.view.addSubview(confirmPasswordField)
        
        self.firstNameField = TitleTextField()
        self.view.addSubview(firstNameField)
        
        self.lastNameField = TitleTextField()
        self.view.addSubview(lastNameField)
        
        self.nextButton = AppRadiusButtonView()
        self.view.addSubview(nextButton)
        
        self.SetUpFields()
    }
    
    func SetUpFields() {
        self.SetUpEmailField()
        self.SetUpPasswordField()
        self.SetUpConfirmPassworField()
        self.SetUpFirstNameField()
        self.SetUpLastNameField()
        self.SetUpNextButton()
    }
    
    func SetUpEmailField() {
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.05).isActive = true
        self.emailField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width * 0.05).isActive = true
        self.emailField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width * 0.05).isActive = true
        self.emailField.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.09).isActive = true
        self.emailField.SetPlaceHolderText("Email")
        self.emailField.errorText = "Should be email or phone"
    }
    
    func SetUpPasswordField() {
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant: self.view.bounds.height * 0.01).isActive = true
        self.passwordField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width * 0.05).isActive = true
        self.passwordField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width * 0.05).isActive = true
        self.passwordField.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.09).isActive = true
        self.passwordField.SetPlaceHolderText("Password")
        self.passwordField.errorText = "Should be more 5 and less then 17"
    }
    
    func SetUpConfirmPassworField(){
        self.confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        self.confirmPasswordField.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: self.view.bounds.height * 0.01).isActive = true
        self.confirmPasswordField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width * 0.05).isActive = true
        self.confirmPasswordField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width * 0.05).isActive = true
        self.confirmPasswordField.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.09).isActive = true
        self.confirmPasswordField.SetPlaceHolderText("Confirm password")
    }
    
    func SetUpFirstNameField(){
       self.firstNameField.translatesAutoresizingMaskIntoConstraints = false
       self.firstNameField.topAnchor.constraint(equalTo: self.confirmPasswordField.bottomAnchor, constant: self.view.bounds.height * 0.01).isActive = true
       self.firstNameField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width * 0.05).isActive = true
       self.firstNameField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width * 0.05).isActive = true
       self.firstNameField.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.09).isActive = true
       self.firstNameField.SetPlaceHolderText("First Name")
    }
    
    func SetUpLastNameField(){
        self.lastNameField.translatesAutoresizingMaskIntoConstraints = false
        self.lastNameField.topAnchor.constraint(equalTo: self.firstNameField.bottomAnchor, constant: self.view.bounds.height * 0.01).isActive = true
        self.lastNameField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width * 0.05).isActive = true
        self.lastNameField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width * 0.05).isActive = true
        self.lastNameField.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.09).isActive = true
        self.lastNameField.SetPlaceHolderText("Last Name")
    }
    
    func SetUpNextButton(){
       self.nextButton.translatesAutoresizingMaskIntoConstraints = false
       self.nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.view.frame.height * 0.05).isActive = true
       self.nextButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width * 0.05).isActive = true
       self.nextButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width * 0.05).isActive = true
       self.nextButton.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.09).isActive = true
       self.nextButton.setTitle("Register", for: .normal)
       self.nextButton.titleLabel?.font = UIFont(name: "Palatino-Bold", size: 30)
       self.nextButton.backgroundColor = .black
       self.nextButton.setTitleColor(.white, for: .normal)
    }
}
