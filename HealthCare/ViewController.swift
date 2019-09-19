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
        
        titleView = AppGradientTextView()
        self.view.addSubview(titleView)
        
        logInPanelView = AppLogInPanelView()
        self.view.addSubview(logInPanelView)
        
        setUpFileds()
    }
    
    func setUpFileds(){
        self.view.backgroundColor = UIColor.init(red: 70/255, green: 202/255, blue: 212/255, alpha: 255/255)
        self.createTitleView()
        self.createLoginPanelView()
    }
    
    func createLoginPanelView(){
        
        self.logInPanelView.translatesAutoresizingMaskIntoConstraints = false
        self.logInPanelView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 50).isActive = true
        self.logInPanelView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -70).isActive = true
        self.logInPanelView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 70).isActive = true
        self.logInPanelView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        self.logInPanelView.logInButton.setTitle("Log In", for: .normal)
        self.logInPanelView.logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        self.logInPanelView.logInButton.backgroundColor = UIColor.init(red: 78/255, green: 78/255, blue: 78/255, alpha: 0.5)
        self.logInPanelView.logInButton.setTitleColor(UIColor.white, for: .normal)

        self.logInPanelView.logInField.backgroundColor = UIColor.init(red: 78/255, green: 78/255, blue: 78/255, alpha: 0.5)
        self.logInPanelView.logInField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logInPanelView.logInField.placeholder = "User name or email"

        self.logInPanelView.passwordField.backgroundColor = UIColor.init(red: 78/255, green: 78/255, blue: 78/255, alpha: 0.5)
        self.logInPanelView.passwordField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.logInPanelView.passwordField.placeholder = "Enter password"

        self.logInPanelView.sigInButton.setTitle("Sign In", for: UIControl.State.normal)
        self.logInPanelView.sigInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        self.logInPanelView.sigInButton.backgroundColor = UIColor.init(red: 78/255, green: 78/255, blue: 78/255, alpha: 0.5)
        self.logInPanelView.sigInButton.setTitleColor(UIColor.white, for: .normal)
    }
   
    func createTitleView() {
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.contentScaleFactor = UIScreen.main.scale
        titleView.SetText("HealthCare")
        titleView.SetFont(UIFont.systemFont(ofSize: 70, weight: .bold))
        titleView.SetFontSize(55)
        let lightgray = UIColor(red:0/255, green: 0/255, blue:0/255, alpha:0.3)
        let white = UIColor.white
        titleView.SetColors([lightgray.cgColor, white.cgColor, lightgray.cgColor])
        titleView.SetLocationsGradient([0, 0.75, 1.0])
        titleView.SetStartPosition(CGPoint(x:0.0, y:0.0))
        titleView.SetEndPosition(CGPoint(x:1.0, y:1.0))
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: view.topAnchor, constant:self.view.bounds.height * 0.2).isActive = true
        titleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: self.view.bounds.width * 0.1).isActive = true
        titleView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -self.view.bounds.width * 0.1).isActive = true
        titleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.75, 1.0 , 1.0]
        gradientAnimation.duration = 6.0
        gradientAnimation.repeatCount = Float.infinity
        titleView.add(gradientAnimation)
    }
    
    func createMainPictures(){
        mainPictures.contentMode = .scaleAspectFill
        mainPictures.contentScaleFactor = UIScreen.main.scale
        mainPictures.translatesAutoresizingMaskIntoConstraints = false
        mainPictures.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        mainPictures.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive  = true
        mainPictures.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        mainPictures.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}



