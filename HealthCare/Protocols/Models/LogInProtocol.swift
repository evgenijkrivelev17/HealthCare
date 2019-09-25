//
//  LogInProtocol.swift
//  HealthCare
//
//  Created by Евгений on 9/24/19.
//  Copyright © 2019 Евгений. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LogInProtocol : class {
    var Login: String { get set }
    var Password: String { get set }
}
