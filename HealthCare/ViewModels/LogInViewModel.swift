//
//  LogInViewModel.swift
//  HealthCare
//
//  Created by Евгений on 9/24/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation


public class LogInViewModel: NSObject {
    
    @objc dynamic var model:LogInProtocol = LoginModel()
    
    override init(){
        super.init()
    }
    
    func GetLogInModel() -> LogInProtocol {
        return model
    }
    
    func SetLogInModel(_ model:LogInProtocol) {
        self.model = model
    }
}
