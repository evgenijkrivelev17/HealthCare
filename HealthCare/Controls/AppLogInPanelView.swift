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
    var footerTextVIew: UILabel!
    var footerButtonView: UILabel!
    
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
        
        self.logInField = UITextField()
        self.addSubview(logInField)
        
        self.passwordField = UITextField()
        self.addSubview(passwordField)
        
        self.sigInButton = AppRadiusButtonView()
        self.addSubview(sigInButton)
    
        self.logInField.delegate = self
        self.passwordField.delegate = self
        
        self.footerTextVIew = UILabel()
        self.addSubview(footerTextVIew)
        
        self.footerButtonView = UILabel()
        self.addSubview(footerButtonView)
    }
    
    override public func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
    }
    
    func InitializeLogInButton(){
        self.logInButton.translatesAutoresizingMaskIntoConstraints = false
        self.logInButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.logInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.logInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.logInButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:0.2).isActive = true
        self.logInButton.addTarget(self, action: #selector(togglePanel), for: .touchUpInside)
    }
    
    func InitializeLogInField(){
        
        self.logInField.keyboardType = .emailAddress
        self.logInField.layer.masksToBounds = true
        self.logInField.layer.cornerRadius = 5
        self.logInField.borderStyle = .roundedRect
        self.logInField.translatesAutoresizingMaskIntoConstraints = false
        self.logInField.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20).isActive = true
        self.logInField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.logInField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.logInField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        self.logInField.backgroundColor = .clear
        self.logInField.placeHolderColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        self.passwordField.layer.masksToBounds = true
        self.passwordField.layer.cornerRadius = 5
        self.passwordField.borderStyle = .roundedRect
        self.passwordField.keyboardType = .default
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.topAnchor.constraint(equalTo: logInField.bottomAnchor, constant: 20).isActive = true
        self.passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.passwordField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        self.passwordField.backgroundColor = .clear
        self.passwordField.placeHolderColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5)
    }

    func InitializeSigInButton(){
        self.sigInButton.translatesAutoresizingMaskIntoConstraints = false
        self.sigInButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:0.2).isActive = true
        self.sigInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.sigInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.sigInButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 20).isActive = true
    }
    
    func InitializeFotterTextView(){
        self.footerTextVIew.contentMode = .top
        self.footerTextVIew.translatesAutoresizingMaskIntoConstraints = false
        self.footerTextVIew.topAnchor.constraint(equalTo: self.sigInButton.bottomAnchor, constant: 15).isActive = true
        self.footerTextVIew.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.footerTextVIew.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        self.footerTextVIew.frame =  CGRect(x: 0,y: 0, width: self.footerTextVIew.bounds.width, height: 20)
        self.footerTextVIew.text = "Forgot password?"
        self.footerTextVIew.font = UIFont(name: "Palatino-Bold", size: 15)
        self.footerTextVIew.textColor = UIColor.gray
    }
    
    func InitializeFotterButtonTextView(){
        self.footerButtonView.contentMode = .top
        self.footerButtonView.translatesAutoresizingMaskIntoConstraints = false
        self.footerButtonView.topAnchor.constraint(equalTo: self.sigInButton.bottomAnchor, constant: 15).isActive = true
        self.footerButtonView.leftAnchor.constraint(equalTo: self.footerTextVIew.rightAnchor, constant: 0).isActive = true
        self.footerButtonView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.footerButtonView.text = "Forgot.."
        self.footerButtonView.frame =  CGRect(x: 0,y: 0, width: self.footerButtonView.bounds.width, height: 20)
        self.footerButtonView.font = UIFont(name: "Palatino-Bold", size: 15)
        self.footerButtonView.textColor = UIColor.init(red: 96/255, green: 207/255, blue: 150/255, alpha: 1)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.InitializeLogInButton()
        self.InitializeLogInField()
        self.InitializeSigInButton()
        self.InitializeFotterTextView()
        self.InitializeFotterButtonTextView()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
     @objc func togglePanel(){
        
    }
}

