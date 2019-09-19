//
//  AppLogInPanelView.swift
//  HealthCare
//
//  Created by Евгений on 9/6/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

public class AppLogInPanelView : UIView, UITextFieldDelegate {
    
    var logInButton:AppRadiusButtonView!
    var logInField: UITextField!
    var passwordField: UITextField!
    var sigInButton: AppRadiusButtonView!
    
    private var IsHiddenPanel: Bool = false
    
    private var hiddenHeightFieldsConstraint:[NSLayoutConstraint] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CreateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CreateView()
    }
    
    func CreateView(){
        self.logInButton = AppRadiusButtonView()
        self.addSubview(logInButton)
        self.InitializeLogInButton()
        
        self.logInField = UITextField()
        self.addSubview(logInField)
        
        self.passwordField = UITextField()
        self.addSubview(passwordField)
        self.InitializeLogInField()
        
        self.sigInButton = AppRadiusButtonView()
        self.addSubview(sigInButton)
        self.InitializeSigInButton()
    self.hiddenHeightFieldsConstraint.append(logInField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2))
    self.hiddenHeightFieldsConstraint.append(passwordField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2))
        
        for constraint in self.hiddenHeightFieldsConstraint {
            constraint.isActive = true
        }
        
        self.logInField.delegate = self
        self.passwordField.delegate = self
    }
    
    
    func InitializeLogInButton(){
        self.logInButton.translatesAutoresizingMaskIntoConstraints = false
        self.logInButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.logInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.logInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.logInButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:0.25).isActive = true
        self.logInButton.addTarget(self, action: #selector(togglePanel), for: .touchUpInside)
    }
    
    func InitializeLogInField(){
        
        self.logInField.keyboardType = .emailAddress
        self.logInField.textColor = .white
        self.logInField.layer.masksToBounds = true
        self.logInField.layer.cornerRadius = 5
        self.logInField.borderStyle = .roundedRect
        self.logInField.translatesAutoresizingMaskIntoConstraints = false
        self.logInField.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20).isActive = true
        self.logInField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.logInField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        self.passwordField.layer.masksToBounds = true
        self.passwordField.layer.cornerRadius = 5
        self.passwordField.borderStyle = .roundedRect
        self.passwordField.keyboardType = .default
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.topAnchor.constraint(equalTo: logInField.bottomAnchor, constant: 20).isActive = true
        self.passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    func InitializeSigInButton(){
        self.sigInButton.translatesAutoresizingMaskIntoConstraints = false
        self.sigInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        self.sigInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.sigInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.sigInButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:0.25).isActive = true
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
     @objc func togglePanel(){
        self.IsHiddenPanel = !self.IsHiddenPanel
        if(self.IsHiddenPanel){
            HidePanel()
        }
        else{
            ShowPanel()
        }
        self.layoutIfNeeded()
    }
    
    private func HidePanel(){
        for constraint in self.hiddenHeightFieldsConstraint {
            constraint.constant = 0
        }
    }
    
    private func ShowPanel(){
        for constraint in self.hiddenHeightFieldsConstraint {
            constraint.constant = 0.2
        }
    }
}

