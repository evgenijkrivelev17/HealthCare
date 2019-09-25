//
//  ViewController.swift
//  HealthCare
//
//  Created by Евгений on 6/27/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleView:AppGradientTextView!
    var logInPanelView: AppLogInPanelView!
    
    var hiddenHeightFieldsConstraint:[NSLayoutConstraint] = []
    @objc dynamic var LogInManager:LogInViewModel!
    
    var logInNameOberver: NSKeyValueObservation!
    var passwordOberver: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LogInManager = LogInViewModel()
        self.view.backgroundColor = UIColor.white
        
        self.titleView = AppGradientTextView()
        self.view.addSubview(titleView)
        
        self.logInPanelView = AppLogInPanelView()
        self.view.addSubview(logInPanelView)
        
        self.setUpFileds()
        self.setObservation()
        
    }
    
    func setObservation(){
        self.logInNameOberver = observe(\ViewController.LogInManager?.model.Login, options:  [.new, .old]) { (vc,change) in
            guard let newLogIn = change.newValue else { return }
            self.logInPanelView.logInField.text = newLogIn
        }
        self.passwordOberver = observe(\ViewController.LogInManager?.model.Password, options:  [.new, .old]) { (vc,change) in
            guard let newPassword = change.newValue else {return }
            self.logInPanelView.passwordField.text = newPassword
        }
    }
    
    func setUpFileds(){
        self.createTitleView()
        self.createLoginPanelView()
    }
    
    func createLoginPanelView(){
        
        self.logInPanelView.translatesAutoresizingMaskIntoConstraints = false
        self.logInPanelView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 50).isActive = true
        self.logInPanelView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -70).isActive = true
        self.logInPanelView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 70).isActive = true
        self.logInPanelView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        
        self.logInPanelView.logInButton.setTitle("Log In", for: .normal)
        self.logInPanelView.logInButton.titleLabel?.font = UIFont(name: "Palatino-Bold", size: 30)
        self.logInPanelView.logInButton.backgroundColor = UIColor.black
        self.logInPanelView.logInButton.setTitleColor(UIColor.white, for: .normal)

        self.logInPanelView.logInField.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.logInPanelView.logInField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logInPanelView.logInField.placeholder = "User name or email"
        self.logInPanelView.logInField.textColor = UIColor.black
        self.logInPanelView.logInField.layer.borderWidth = 2
        self.logInPanelView.logInField.addTarget(self, action: #selector(chagngedLogInField), for: .editingChanged)
        self.logInPanelView.passwordField.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.logInPanelView.passwordField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logInPanelView.passwordField.placeholder = "Enter password"
        self.logInPanelView.passwordField.layer.borderWidth = 2
        self.logInPanelView.passwordField.addTarget(self, action: #selector(chagngedPasswordField), for: .editingChanged)
        
        self.logInPanelView.sigInButton.setTitle("Sign In", for: .normal)
        self.logInPanelView.sigInButton.titleLabel?.font = UIFont(name: "Palatino-Bold", size: 30)
        self.logInPanelView.sigInButton.backgroundColor = UIColor.black
        self.logInPanelView.sigInButton.setTitleColor(UIColor.white, for: .normal)
        self.logInPanelView.sigInButton.addTarget(self, action: #selector(CreateAccount), for: .touchDown)
    }
   
    func createTitleView() {
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.contentScaleFactor = UIScreen.main.scale
        titleView.SetText("HealthCare")
        let blackColor = UIColor.black
        let lightGray = UIColor.lightGray
        titleView.SetColors([lightGray.cgColor, blackColor.cgColor, lightGray.cgColor])
        titleView.SetLocationsGradient([0, 0.75, 1.0])
        titleView.SetStartPosition(CGPoint(x:0.0, y:0.0))
        titleView.SetEndPosition(CGPoint(x:1.0, y:0.0))
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: view.topAnchor, constant:self.view.bounds.height * 0.1).isActive = true
        titleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: self.view.bounds.width * 0.1).isActive = true
        titleView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -self.view.bounds.width * 0.1).isActive = true
        titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.75, 1.0 , 1.0]
        gradientAnimation.duration = 6.0
        gradientAnimation.repeatCount = Float.infinity
        titleView.add(gradientAnimation)
    }
    
    @objc func chagngedLogInField() {
        self.LogInManager!.model.Login = self.logInPanelView.logInField.text ??  ""
    }
    
    @objc func chagngedPasswordField() {
        self.LogInManager!.model.Password = self.logInPanelView.passwordField.text ?? ""
    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @objc func CreateAccount(){
        let registerController = RegisterAccountController()
        self.present(registerController, animated: true, completion: nil)
    }
    
}



