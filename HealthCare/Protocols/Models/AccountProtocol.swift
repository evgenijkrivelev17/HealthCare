//
//  AccountProtocol.swift
//  HealthCare
//
//  Created by Евгений on 10/14/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation

protocol AccountProtocol: class {
    var LogIn: String { get set }
    var Password: String { get set }
    var ConfirmPassword: String { get set }
    var BirthDay: Date { get set }
    var Phone: String { get set }
    var Email: String { get set }
    var FirstName: String { get set }
    var LastName: String { get set }
}
