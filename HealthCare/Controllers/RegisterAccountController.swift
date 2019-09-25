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
    
    
    override public func viewDidLoad() {
        self.view.backgroundColor = .white
        super.viewDidLoad()
        
        self.emailField = TitleTextField()
        self.view.addSubview(emailField)
        
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.05).isActive = true
        self.emailField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width * 0.05).isActive = true
        self.emailField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width * 0.05).isActive = true
        self.emailField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.emailField.backgroundColor = .red
    }
}
