//
//  LoginModel.swift
//  HealthCare
//
//  Created by Евгений on 9/15/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

public class LoginModel: NSObject, LogInProtocol {
    
    @objc dynamic var Login:String
    @objc dynamic var Password:String
    
    override init(){
        Login = ""
        Password = ""
        super.init()
    }
}
