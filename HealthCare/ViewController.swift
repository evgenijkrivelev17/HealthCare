//
//  ViewController.swift
//  HealthCare
//
//  Created by Евгений on 6/27/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isHiddenFields:Bool = false
    var TIME_ANIMATION = 0.5
    var titleView:AppGradientTextView!
    var logInPanelView: AppLogInPanelView!
    var mainPictures: UIImageView!
    
    var hiddenHeightFieldsConstraint:[NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainPictures = UIImageView(image: UIImage(named: "main_logo"))
        
        self.titleView = AppGradientTextView()
        self.view.addSubview(titleView)
        
        self.logInPanelView = AppLogInPanelView()
        self.view.addSubview(logInPanelView)
        
        setUpFileds()
    }
    
    func setUpFileds(){
        self.view.backgroundColor = UIColor.white
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
        self.logInPanelView.passwordField.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.logInPanelView.passwordField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logInPanelView.passwordField.placeholder = "Enter password"
        self.logInPanelView.passwordField.layer.borderWidth = 2
        
        self.logInPanelView.sigInButton.setTitle("Sign In", for: .normal)
        self.logInPanelView.sigInButton.titleLabel?.font = UIFont(name: "Palatino-Bold", size: 30)
        self.logInPanelView.sigInButton.backgroundColor = UIColor.black
        self.logInPanelView.sigInButton.setTitleColor(UIColor.white, for: .normal)
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
    
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}



