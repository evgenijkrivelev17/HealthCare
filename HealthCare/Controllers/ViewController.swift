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
    
    var LogInModelOberver: NSKeyValueObservation!
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
        self.setUpView()
    }
    
    func setObservation(){
        self.LogInModelOberver = observe(\ViewController.LogInManager?.model, options:  [.new, .old]) { (vc,change) in
            guard let newModel = change.newValue else { return }
            self.logInPanelView.logInField.text = newModel?.Login
            self.logInPanelView.passwordField.text = newModel?.Password
        }
    }
    
    func setUpFileds(){
        self.createTitleView()
        self.createLoginPanelView()
    }
    
    func setUpView(){
        self.view.backgroundColor = AppConstans.APP_DEFAULT_VIEW_BACKGROUND_COLOR
    }
    
    func createLoginPanelView(){
        
        self.logInPanelView.translatesAutoresizingMaskIntoConstraints = false
        self.logInPanelView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 50).isActive = true
        self.logInPanelView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -70).isActive = true
        self.logInPanelView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 70).isActive = true
        self.logInPanelView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        
        self.logInPanelView.logInButton.setTitle("Log In", for: .normal)
        self.logInPanelView.logInButton.titleLabel?.font = UIFont(name: "Palatino-Bold", size: 30)
        self.logInPanelView.logInButton.setTitleColor(UIColor.white, for: .normal)
        self.logInPanelView.logInButton.layer.backgroundColor = AppConstans.APP_DEFAULT_SUCCESS_BUTTON_COLOR.cgColor
        self.logInPanelView.logInButton.layer.masksToBounds = true
        self.logInPanelView.logInButton.layer.cornerRadius = 5
        

        self.logInPanelView.logInField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logInPanelView.logInField.placeholder = "User name or email"
        self.logInPanelView.logInField.textColor = .white
        self.logInPanelView.logInField.layer.borderWidth = 2
        self.logInPanelView.logInField.layer.borderColor = UIColor.white.cgColor
        self.logInPanelView.logInField.addTarget(self, action: #selector(chagngedLogInField), for: .editingChanged)
        self.logInPanelView.logInField.contentScaleFactor = UIScreen.main.scale
        
        self.logInPanelView.passwordField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logInPanelView.passwordField.placeholder = "Enter password"
        self.logInPanelView.passwordField.textColor = .white
        self.logInPanelView.passwordField.layer.borderColor = UIColor.white.cgColor
        self.logInPanelView.passwordField.layer.borderWidth = 2
        self.logInPanelView.passwordField.contentScaleFactor = UIScreen.main.scale
        self.logInPanelView.passwordField.addTarget(self, action: #selector(chagngedPasswordField), for: .editingChanged)
        
        self.logInPanelView.sigInButton.setTitle("Sign In", for: .normal)
        self.logInPanelView.sigInButton.titleLabel?.font = UIFont(name: "Palatino-Bold", size: 30)
        self.logInPanelView.sigInButton.setTitleColor(UIColor.white, for: .normal)
        self.logInPanelView.sigInButton.addTarget(self, action: #selector(CreateAccount), for: .touchDown)
        self.logInPanelView.sigInButton.layer.backgroundColor = AppConstans.APP_DEFAULT_SUCCESS_BUTTON_COLOR.cgColor
        self.logInPanelView.sigInButton.layer.masksToBounds = true
        self.logInPanelView.sigInButton.layer.cornerRadius = 5
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
    
    @objc func chagngedLogInField(_ textField: UITextField) {
        self.LogInManager!.GetLogInModel().Login = textField.text ??  ""
    }
    
    @objc func chagngedPasswordField(_ textField: UITextField) {
        self.LogInManager!.GetLogInModel().Password = textField.text ?? ""
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



