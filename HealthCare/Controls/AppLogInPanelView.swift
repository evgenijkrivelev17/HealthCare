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
    
    private var IsHiddenPanel: Bool = true
    
    private var topAnchorLogInConstraint: NSLayoutConstraint!
    private var heightLogInConstraint: NSLayoutConstraint!
    
    private var topAnchorPasswordConstraint: NSLayoutConstraint!
    private var heightPasswordConstraint: NSLayoutConstraint!
    
    private var firstTopAnchorSignInConstraint: NSLayoutConstraint!
    private var secondTopAnchorSignInConstraint: NSLayoutConstraint!
    
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
    
        self.logInField.delegate = self
        self.passwordField.delegate = self
        
        self.footerTextVIew = UILabel()
        self.addSubview(footerTextVIew)
        self.InitializeFotterTextView()
        
        self.footerButtonView = UILabel()
        self.addSubview(footerButtonView)
        self.InitializeFotterButtonTextView()
        
        self.InitializeConstraints()
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
        self.topAnchorLogInConstraint = self.logInField.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20)
        self.heightLogInConstraint = self.logInField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0)
        self.logInField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.logInField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        self.passwordField.layer.masksToBounds = true
        self.passwordField.layer.cornerRadius = 5
        self.passwordField.borderStyle = .roundedRect
        self.passwordField.keyboardType = .default
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchorPasswordConstraint = self.passwordField.topAnchor.constraint(equalTo: logInField.bottomAnchor, constant: 20)
        self.heightPasswordConstraint = self.passwordField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0)
        self.passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    func InitializeSigInButton(){
        self.sigInButton.translatesAutoresizingMaskIntoConstraints = false
        self.firstTopAnchorSignInConstraint = self.sigInButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 20)
        self.secondTopAnchorSignInConstraint = self.sigInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20)
        self.sigInButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier:0.2).isActive = true
        self.sigInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.sigInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
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
        self.footerButtonView.textColor = UIColor.black
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    private func InitializeConstraints(){
        self.topAnchorLogInConstraint.isActive = true
        self.heightLogInConstraint.isActive = true
        self.topAnchorPasswordConstraint.isActive = true
        self.heightPasswordConstraint.isActive = true
        self.firstTopAnchorSignInConstraint.isActive = true
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
    }
    
    private func HidePanel(){
        UIView.animate(withDuration: 0.5, animations: {
            self.heightLogInConstraint.constant = 0
            self.heightPasswordConstraint.constant = 0
            self.firstTopAnchorSignInConstraint.isActive = true
            self.secondTopAnchorSignInConstraint.isActive = false
            self.layoutIfNeeded()
        })
    }
    
    private func ShowPanel(){
        UIView.animate(withDuration: 0.5, animations: {
            self.heightLogInConstraint.constant = self.frame.height * 0.15
            self.heightPasswordConstraint.constant = self.frame.height * 0.15
            self.firstTopAnchorSignInConstraint.isActive = false
            self.secondTopAnchorSignInConstraint.isActive = true
            self.layoutIfNeeded()
        })
    }
}

